class BusRoute {
  final int id;
  final String busName;
  final String originName;
  final String originCoord;
  final String destinationName;
  final String destinationCoord;
  final String totalDistance;

  BusRoute({
    required this.id,
    required this.busName,
    required this.originName,
    required this.originCoord,
    required this.destinationName,
    required this.destinationCoord,
    required this.totalDistance,
  });
}
