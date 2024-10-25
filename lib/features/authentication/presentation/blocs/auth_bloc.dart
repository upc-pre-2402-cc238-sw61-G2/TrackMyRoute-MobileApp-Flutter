import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/data/remote/auth_service.dart';
import 'package:trackmyroute_flutter/shared/domain/entities/user.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_event.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(AuthInitialState()){
    on<AuthorizeUser>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          User user = await AuthService().signIn(event.user, event.password);
          emit(AuthLoadedState(user: user));
        } catch(e){
          emit(AuthErrorState(message: e.toString()));
        }
      },
    );
    on<RegisterUser>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          User user = await AuthService().signUp(event.user, event.password);
          emit(AuthLoadedState(user: user));
        } catch(e){
          emit(AuthErrorState(message: e.toString()));
        }
      },
    );
  }
}