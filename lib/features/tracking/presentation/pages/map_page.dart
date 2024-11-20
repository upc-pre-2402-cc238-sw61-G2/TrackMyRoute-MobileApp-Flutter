import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  final LatLng origin;
  final LatLng destination;

  const MapPage({Key? key, required this.origin, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Ruta'),
        backgroundColor: Colors.teal,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: origin,
          zoom: 10,
        ),
        markers: {
          Marker(markerId: MarkerId('origin'), position: origin),
          Marker(markerId: MarkerId('destination'), position: destination),
        },
      ),
    );
  }
}
