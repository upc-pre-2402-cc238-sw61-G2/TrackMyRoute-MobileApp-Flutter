import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_event.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_state.dart';
import 'package:trackmyroute_flutter/features/tracking/domain/bus_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_page.dart';

class BusRoutesPage extends StatelessWidget {
  const BusRoutesPage({super.key});

  void _navigateToMap(BuildContext context, BusRoute busRoute) {
    // Convierte las coordenadas de origen y destino en LatLng
    final originCoords = busRoute.originCoord.split(',').map(double.parse).toList();
    final destinationCoords = busRoute.destinationCoord.split(',').map(double.parse).toList();

    final origin = LatLng(originCoords[0], originCoords[1]);
    final destination = LatLng(destinationCoords[0], destinationCoords[1]);

    // Navega a la página de mapa
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(origin: origin, destination: destination),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusRouteBloc()..add(GetBusRoutesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rutas de Bus'),
          backgroundColor: Colors.teal,
        ),
        body: BlocBuilder<BusRouteBloc, BusRouteState>(
          builder: (context, state) {
            if (state is BusRouteLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BusRouteLoadedState) {
              return ListView.builder(
                itemCount: state.busRoutes.length,
                itemBuilder: (context, index) {
                  final busRoute = state.busRoutes[index];
                  return ListTile(
                    title: Text(busRoute.busName),
                    subtitle: Text(
                        '${busRoute.originName} ➔ ${busRoute.destinationName}'),
                    trailing: Text('${busRoute.totalDistance} km'),
                    onTap: () => _navigateToMap(context, busRoute),
                  );
                },
              );
            } else if (state is BusRouteErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No se encontraron rutas'));
            }
          },
        ),
      ),
    );
  }
}

