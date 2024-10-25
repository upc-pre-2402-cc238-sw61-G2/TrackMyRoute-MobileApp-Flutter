import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/pages/auth_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen()
      ),
      home: const PromoListPage(),
    );
  }
}