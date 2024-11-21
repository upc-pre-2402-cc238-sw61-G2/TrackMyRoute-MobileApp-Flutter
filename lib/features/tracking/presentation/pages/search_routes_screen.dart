import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/pages/bus_route_page.dart';

class SearchRoutesScreen extends StatefulWidget {
  const SearchRoutesScreen({super.key});

  @override
  State<SearchRoutesScreen> createState() => _SearchRoutesScreenState();
}

class _SearchRoutesScreenState extends State<SearchRoutesScreen> {
  final TextEditingController searchController = TextEditingController();
  late GoogleMapController _mapController;
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194), // Coordenadas iniciales (San Francisco, por ejemplo)
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Buscar rutas...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BusRoutesPage(),
                    ),
                  );
                },
                child: const Text('Ver todas las rutas'),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2, // Ajusta este valor para controlar el tamaño del mapa
          child: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true, // Habilita la ubicación del dispositivo
            myLocationButtonEnabled: true,
          ),
        ),
      ],
    );
  }
}
