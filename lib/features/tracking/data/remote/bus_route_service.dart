import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:trackmyroute_flutter/core/constants/app_constants.dart';
import 'package:trackmyroute_flutter/core/utils/resource.dart';
import 'package:trackmyroute_flutter/features/tracking/data/remote/bus_route_dto.dart';
import 'package:trackmyroute_flutter/features/tracking/domain/bus_route.dart';

class BusRouteService {
  Future<BusRoute> createBusRoute(String busName, String originName, String originCoord, String destinationName, String destinationCoord, String totalDistance) async {
    final uri = Uri.parse('${AppConstants.baseUrl}/bus-route');
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
  
  Future<Resource<List<BusRouteDto>>> getBusRoutes() async {
    String url = '${AppConstants.baseUrl}/bus-route';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        dynamic jsonResponse = jsonDecode(response.body);
        List busRoutes = jsonResponse['results'];
        return Success(busRoutes.map((map) => BusRouteDto.fromJson(map)).toList());
      } else {
       return Error('Error: ${response.statusCode}');
      }
    } catch(error) {
      return Error('Error: ${error.toString()}');
    }
  }
}