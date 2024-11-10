import 'package:trackmyroute_flutter/core/utils/resource.dart';
import 'package:trackmyroute_flutter/features/tracking/data/remote/bus_route_dto.dart';
import 'package:trackmyroute_flutter/features/tracking/data/remote/bus_route_service.dart';
import 'package:trackmyroute_flutter/features/tracking/domain/bus_route.dart';

class BusRouteRepository {
  Future<Resource<List<BusRoute>>> getBusRoutes() async {
    Resource<List<BusRouteDto>> result = await BusRouteService().getBusRoutes();

    if (result is Success) {
      return Success(result.data!.map((busRouteDto) => busRouteDto.toBusRoute()).toList());
    } else {
      return Error(result.message!);
    }
  }
}