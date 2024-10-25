import 'package:trackmyroute_flutter/shared/domain/entities/user.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final User user;
  AuthLoadedState({required this.user});
}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}