abstract class BusRouteState {}

class BusRouteInitialState extends BusRouteState {}

class BusRouteLoadingState extends BusRouteState {}

class BusRouteLoadedState extends BusRouteState {
  final String busName;
  final String originName;
  final String originCoord;
  final String destinationName;
  final String destinationCoord;
  final String totalDistance;

  BusRouteLoadedState({
    required this.busName,
    required this.originName,
    required this.originCoord,
    required this.destinationName,
    required this.destinationCoord,
    required this.totalDistance,
  });
}

class BusRouteErrorState extends BusRouteState {
  final String message;

  BusRouteErrorState({required this.message});
}