abstract class BusRouteEvent {}

class AuthorizeBusRoute extends BusRouteEvent{
  String busName;
  String originName;
  String originCoord;
  String destinationName;
  String destinationCoord;
  String totalDistance;

  AuthorizeBusRoute({
    required this.busName,
    required this.originName,
    required this.originCoord,
    required this.destinationName,
    required this.destinationCoord,
    required this.totalDistance
  });
}

class CreateBusRoute extends BusRouteEvent {
  final String busName;
  final String originName;
  final String originCoord;
  final String destinationName;
  final String destinationCoord;
  final String totalDistance;

  CreateBusRoute({
    required this.busName,
    required this.originName,
    required this.originCoord,
    required this.destinationName,
    required this.destinationCoord,
    required this.totalDistance
  });
}