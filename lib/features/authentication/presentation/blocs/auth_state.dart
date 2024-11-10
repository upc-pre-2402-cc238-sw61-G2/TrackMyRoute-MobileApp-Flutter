import 'package:trackmyroute_flutter/features/authentication/domain/entities/reg_message.dart';
import 'package:trackmyroute_flutter/shared/domain/entities/user.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final User user;
  const AuthLoadedState({required this.user});
}

class RegisterSuccess extends AuthState{
  final RegMessage regMessage;
  const RegisterSuccess({required this.regMessage});
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});
}