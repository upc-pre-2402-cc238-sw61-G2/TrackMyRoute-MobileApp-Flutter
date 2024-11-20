import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/core/utils/resource.dart';
import 'package:trackmyroute_flutter/features/tracking/data/repository/bus_route_repository.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_event.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/blocs/bus_route_state.dart';
import 'package:trackmyroute_flutter/features/tracking/domain/bus_route.dart';

class BusRouteBloc extends Bloc<BusRouteEvent, BusRouteState> {
  BusRouteBloc() : super(BusRouteInitialState()){
    on<GetBusRoutesEvent>(
            (event, emit) async {
          final currentState = state;
          List<BusRoute> busRoutes = [];

          if (currentState is BusRouteLoadedState) {
            busRoutes = currentState.busRoutes;
          }

          emit(BusRouteLoadingState());

          final Resource<List<BusRoute>> result =
          await BusRouteRepository().getBusRoutes();

          if (result is Success) {
            final newBusRoutes = result.data!;
            final hasReachedEnd = newBusRoutes.length < 20;

            busRoutes = List.from(busRoutes)..addAll(newBusRoutes);
            emit(BusRouteLoadedState(busRoutes: busRoutes, hasReachedEnd: hasReachedEnd));
          } else {
            emit(BusRouteErrorState(message: result.message!));
          }
        }
    );
  }
}