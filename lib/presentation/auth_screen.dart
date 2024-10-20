import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/presentation/login_screen.dart';
import 'package:trackmyroute_flutter/presentation/signup_screen.dart';

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
                Tab(text: 'Login'),
                Tab(text: 'Sign Up'),
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