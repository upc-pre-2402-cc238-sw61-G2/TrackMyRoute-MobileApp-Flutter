import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_event.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_state.dart';

class BusRoutesPage extends StatelessWidget {
  const BusRoutesPage({super.key});

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
