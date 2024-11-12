import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_state.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/pages/login_screen.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/pages/signup_screen.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: const Text('Track My Route', style: TextStyle(color: Colors.white)),
                  bottom: const TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
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
    );
    
  }
}