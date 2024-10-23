import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/login_screen.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/signup_screen.dart';

class AuthScreen extends StatelessWidget{
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TrackMyRoute'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Iniciar Sesión'),
                Tab(text: 'Regístrate'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              LoginScreen(),
              SignupScreen()
            ],
          ),
        ),
      ),
    );
  }
}