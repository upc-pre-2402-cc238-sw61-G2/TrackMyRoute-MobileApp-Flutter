import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/shared/presentation/home_page.dart';
import 'package:trackmyroute_flutter/features/tracking/data/remote/bus_route_service.dart';

class CreateBusRouteScreen extends StatefulWidget {
  const CreateBusRouteScreen({Key? key}) : super(key: key);

  @override
  State<CreateBusRouteScreen> createState() => _CreateBusRouteScreenState();
}

class _CreateBusRouteScreenState extends State<CreateBusRouteScreen> {
  final BusRouteService _busRouteService = BusRouteService();

  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _originNameController = TextEditingController();
  final TextEditingController _originCoordController = TextEditingController();
  final TextEditingController _destinationNameController = TextEditingController();
  final TextEditingController _destinationCoordController = TextEditingController();
  final TextEditingController _totalDistanceController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitBusRoute() async {
    setState(() => _isLoading = true);

    try {
      final busRoute = await _busRouteService.createBusRoute(
        _busNameController.text,
        _originNameController.text,
        _originCoordController.text,
        _destinationNameController.text,
        _destinationCoordController.text,
        _totalDistanceController.text,
      );

      if (busRoute.busName.isNotEmpty) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        _showAlert('Success', 'Bus route created successfully!');
      } else {
        _showAlert('Error', 'Failed to create bus route.');
      }
    } catch (e) {
      _showAlert('Error', 'An error occurred: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildTextField(_busNameController, 'Bus Name'),
              const SizedBox(height: 10),
              _buildTextField(_originNameController, 'Origin Name'),
              const SizedBox(height: 10),
              _buildTextField(_originCoordController, 'Origin Coord'),
              const SizedBox(height: 10),
              _buildTextField(_destinationNameController, 'Destination Name'),
              const SizedBox(height: 10),
              _buildTextField(_destinationCoordController, 'Destination Coord'),
              const SizedBox(height: 10),
              _buildTextField(_totalDistanceController, 'Total Distance'),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitBusRoute,
                      child: const Text('Create Route'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }

  @override
  void dispose() {
    _busNameController.dispose();
    _originNameController.dispose();
    _originCoordController.dispose();
    _destinationNameController.dispose();
    _destinationCoordController.dispose();
    _totalDistanceController.dispose();
    super.dispose();
  }
}
