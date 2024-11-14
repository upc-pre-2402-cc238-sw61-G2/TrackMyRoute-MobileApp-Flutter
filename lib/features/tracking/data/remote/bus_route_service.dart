import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:trackmyroute_flutter/core/utils/resource.dart';
import 'package:trackmyroute_flutter/features/tracking/data/remote/bus_route_dto.dart';

import '../../../../core/constants/app_constants.dart';

class BusRouteService {
  Future<Resource<List<BusRouteDto>>> getBusRoutes() async {
    String url = '${AppConstants.baseUrl}/bus-route';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        // Mapeamos cada elemento de la lista al modelo BusRouteDto
        List<BusRouteDto> busRoutes =
        jsonResponse.map((map) => BusRouteDto.fromJson(map)).toList();
        return Success(busRoutes);
      } else {
        return Error('Error: ${response.statusCode}');
      }
    } catch (error) {
      return Error('Error: ${error.toString()}');
    }
  }
}
