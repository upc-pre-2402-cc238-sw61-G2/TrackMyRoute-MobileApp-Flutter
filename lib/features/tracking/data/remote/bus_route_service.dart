import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:trackmyroute_flutter/shared/domain/entities/bus_route.dart';

class BusRouteService {
  final String _baseUrl = "https://track-my-route-web-services-cjf2ametdehhdshp.eastus-01.azurewebsites.net/";

  Future<BusRoute> createBusRoute(String busName, String originName, String originCoord, String destinationName, String destinationCoord, String totalDistance) async {
    final uri = Uri.parse('$_baseUrl/api/v1/bus-route');
    final headers = {'Content-Type': 'application/json'};
    final encoding = Encoding.getByName('utf-8');
    Map<String, dynamic> body = {
      'busName': busName,
      'originName': originName,
      'originCoord': originCoord,
      'destinationName': destinationName,
      'destinationCoord': destinationCoord,
      'totalDistance': totalDistance
    };
    String jsonBody = json.encode(body);

    http.Response response = await http.post(uri, headers: headers, body: jsonBody, encoding: encoding);

    if (response.statusCode == HttpStatus.ok) {
      return BusRoute(busName: busName, originName: originName, originCoord: originCoord, destinationName: destinationName, destinationCoord: destinationCoord, totalDistance: totalDistance);
    }
    
    return BusRoute(busName: "", originName: "", originCoord: "", destinationName: "", destinationCoord: "", totalDistance: "");
  }
}