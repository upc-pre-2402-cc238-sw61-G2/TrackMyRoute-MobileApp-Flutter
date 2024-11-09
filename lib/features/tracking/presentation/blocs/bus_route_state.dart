import 'package:trackmyroute_flutter/features/tracking/domain/bus_route.dart';

abstract class BusRouteState {}

class BusRouteInitialState extends BusRouteState {}

class BusRouteLoadingState extends BusRouteState {}

class BusRouteLoadedState extends BusRouteState {
  final List<BusRoute> busRoutes;
  final bool hasReachedEnd;

  BusRouteLoadedState({required this.busRoutes, required this.hasReachedEnd});
}

class BusRouteErrorState extends BusRouteState {
  final String message;

  BusRouteErrorState({required this.message});
}