import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackmyroute_flutter/features/tracking/domain/bus_route.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_event.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_state.dart';
import '../../../payment/application/home_controller.dart';
import 'map_page.dart';

class BusRoutesPage extends StatelessWidget {
  const BusRoutesPage({super.key});

  // Función para navegar al mapa con coordenadas
  void _navigateToMap(BuildContext context, BusRoute busRoute) {
    try {
      // Convierte las coordenadas de origen y destino
      final originCoords = busRoute.originCoord.split(',').map(double.tryParse).toList();
      final destinationCoords = busRoute.destinationCoord.split(',').map(double.tryParse).toList();

      if (originCoords.length == 2 && originCoords[0] != null && originCoords[1] != null &&
          destinationCoords.length == 2 && destinationCoords[0] != null && destinationCoords[1] != null) {

        // Crea las coordenadas de origen y destino para el mapa
        final origin = LatLng(originCoords[0]!, originCoords[1]!);
        final destination = LatLng(destinationCoords[0]!, destinationCoords[1]!);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapPage(origin: origin, destination: destination),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Coordenadas inválidas')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Formato de coordenadas incorrecto')),
      );
    }
  }

  // Función para iniciar el proceso de pago
  void _initiatePayment(BuildContext context, BusRoute busRoute) async {
    final homeController = HomeController();

    await homeController.makePayment();
    await homeController.postPayment(
      busName: busRoute.busName,
      originName: busRoute.originName,
      destinationName: busRoute.destinationName,
      ticketPrice: busRoute.totalDistance,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusRouteBloc()..add(GetBusRoutesEvent()),
      child: Scaffold(
        appBar: AppBar(
         title: const Text('Track My Route', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                    subtitle: Text('${busRoute.originName} ➔ ${busRoute.destinationName}'),
                    trailing: Text('${busRoute.totalDistance} km'),
                    onTap: () {
                      // Iniciar pago o mostrar mapa al hacer clic en la ruta
                      _initiatePayment(context, busRoute);
                    },
                    onLongPress: () {
                      // Navegar al mapa cuando se presiona prolongadamente
                      _navigateToMap(context, busRoute);
                    },
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
