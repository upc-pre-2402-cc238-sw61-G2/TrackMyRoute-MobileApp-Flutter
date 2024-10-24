import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/pages/create_bus_route_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusRouteBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CreateBusRouteScreen(),
      ),
    );
  }
}
