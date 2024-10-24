import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/tracking/data/remote/bus_route_service.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_event.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_state.dart';
import 'package:trackmyroute_flutter/shared/domain/entities/bus_route.dart';

class BusRouteBloc extends Bloc<BusRouteEvent, BusRouteState> {
  BusRouteBloc() : super(BusRouteInitialState()){
    on<AuthorizeBusRoute>(
      (event, emit) async {
        emit(BusRouteLoadingState());
        try {
          BusRoute busRoute = await BusRouteService().createBusRoute(event.busName, event.originName, event.originCoord, event.destinationName, event.destinationCoord, event.totalDistance);
          emit(BusRouteLoadedState(busName: busRoute.busName, originName: busRoute.originName, originCoord: busRoute.originCoord, destinationName: busRoute.destinationName, destinationCoord: busRoute.destinationCoord, totalDistance: busRoute.totalDistance));  
        } catch(e) {
          emit(BusRouteErrorState(message: e.toString()));
        }
      }
    );
  }
}