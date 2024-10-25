import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_event.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_state.dart';
import 'package:trackmyroute_flutter/shared/presentation/home_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is AuthInitialState){
          return Center(
            child: Card(
              margin: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(labelText: 'Usuario'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _pwController,
                      decoration: const InputDecoration(labelText: 'Contraseña'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(RegisterUser(user: _userController.text, password: _pwController.text));
                      },
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AuthLoadingState) {
          return const Center (
            child: SizedBox (
              width: 30, height: 30,
              child: CircularProgressIndicator())); 
        } else if (state is AuthErrorState){
          state is AuthInitialState;
          return const SignupScreen();
        } 
        else {
          return const HomePage();
        }
      },
    );

  }
}