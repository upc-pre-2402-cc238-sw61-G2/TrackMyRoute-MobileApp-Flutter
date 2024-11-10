import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/core/utils/resource.dart';
import 'package:trackmyroute_flutter/features/authentication/domain/entities/reg_message.dart';
import 'package:trackmyroute_flutter/features/authentication/data/repository/auth_repository.dart';
import 'package:trackmyroute_flutter/shared/domain/entities/user.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_event.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super(AuthInitialState()){
    on<AuthorizeUser>(
      (event, emit) async {
        emit(AuthLoadingState());
        Resource<User> result = await AuthRepository().signIn(event.user, event.password);
        
        if (result is Success) {
          emit(AuthLoadedState(user: result.data!));
        } else {
          emit(AuthErrorState(message: result.message!));
        }
      },
    );
    on<RegisterUser>(
      (event, emit) async {
        emit(AuthLoadingState());
        Resource<RegMessage> result = await AuthRepository().signUp(event.user, event.password);
        
        if (result is Success) {
          emit(RegisterSuccess(regMessage: result.data!));
        } else {
          emit(AuthErrorState(message: result.message!));
        }
      },
    );
  }
}