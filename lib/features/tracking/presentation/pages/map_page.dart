import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final LatLng origin;
  final LatLng destination;

  const MapPage({super.key, required this.origin, required this.destination});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de la Ruta'),
        backgroundColor: Colors.teal,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.origin,
          zoom: 10,
        ),
        markers: {
          Marker(
            markerId: MarkerId('origin'),
            position: widget.origin,
            infoWindow: InfoWindow(title: 'Origen'),
          ),
          Marker(
            markerId: MarkerId('destination'),
            position: widget.destination,
            infoWindow: InfoWindow(title: 'Destino'),
          ),
        },
      ),
    );
  }
}
