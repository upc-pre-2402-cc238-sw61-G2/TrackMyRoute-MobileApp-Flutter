import 'package:flutter/material.dart';
import '../../../../shared/widgets/payment_form.dart';
import '../../application/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Stripe Payment TrackMyRoute"),
      ),
      body: PaymentForm(homeController: homeController),
    );
  }
}
