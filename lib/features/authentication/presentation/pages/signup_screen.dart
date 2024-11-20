import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_event.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_state.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/hidden_password_cubit.dart';
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
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state){
            if (state is AuthLoadingState){
              const Center (
                child: SizedBox (
                  width: 30, height: 30,
                  child: CircularProgressIndicator()
                )
              );
            } else if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('¡Bienvenid@ TrackMyRoute!'),
                ),
              );
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            } else if (state is AuthErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            } 
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      label: Text('Usuario')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<HiddenPasswordCubit, bool>(
                  builder: (context, state) {
                    return TextField(
                      obscureText: state,
                      controller: _pwController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          suffixIcon: IconButton(
                               onPressed: () {
                                context.read<HiddenPasswordCubit>().changeVisibility();
                              }, icon: Icon(state ? Icons.visibility : Icons.visibility_off)),
                          border: const OutlineInputBorder(),
                          label: const Text('Contraseña')),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      final String username = _userController.text;
                      final String password = _pwController.text;
                      context.read<AuthBloc>().add(RegisterUser(
                          user: username, password: password));
                    },
                    child: const Text('Registrarse'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
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
  */
}