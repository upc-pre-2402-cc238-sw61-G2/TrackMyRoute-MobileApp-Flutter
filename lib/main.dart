import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/hidden_password_cubit.dart';
import 'core/constants/stripe_consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:trackmyroute_flutter/features/authentication/presentation/pages/auth_screen.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => HiddenPasswordCubit())
      ], 
      child: MaterialApp(
        home: const AuthScreen(),
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
      ),
    ) ;
  }
}