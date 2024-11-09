import 'package:trackmyroute_flutter/features/tracking/domain/bus_route.dart';

class BusRouteDto {
  final String busName;
  final String originName;
  final String originCoord;
  final String destinationName;
  final String destinationCoord;
  final String totalDistance;

  BusRouteDto({
    required this.busName,
    required this.originName,
    required this.originCoord,
    required this.destinationName,
    required this.destinationCoord,
    required this.totalDistance
  });

  factory BusRouteDto.fromJson(Map<String, dynamic> json) {
    return BusRouteDto(
      busName: json['busName'] ?? '',
      originName: json['originName'] ?? '',
      originCoord: json['originCoord'] ?? '',
      destinationName: json['destinationName'] ?? '',
      destinationCoord: json['destinationCoord'] ?? '',
      totalDistance: json['totalDistance'] ?? ''
    );
  }

  BusRoute toBusRoute() {
    return BusRoute(
      busName: busName,
      originName: originName,
      originCoord: originCoord,
      destinationName: destinationName,
      destinationCoord: destinationCoord,
      totalDistance: totalDistance
    );
  }
}