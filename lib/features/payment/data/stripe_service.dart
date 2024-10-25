import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../core/constants/stripe_consts.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();
  final Dio _dio = Dio();

  Future<void> makePayment() async {
    try {
      // Crear el Intent de Pago en Stripe
      String? paymentIntentClientSecret =
          await _createPaymentIntent(100, "usd");
      if (paymentIntentClientSecret == null) return;

      // Configurar la hoja de pagos de Stripe
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "TrackMyRoute",
        ),
      );

      // Presentar la hoja de pagos para completar el pago
      await _processPayment();
    } catch (e) {
      print("Error en makePayment: $e");
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      Map<String, dynamic> data = {
        "amount": amount * 100, // Convertir a la unidad más baja de la moneda
        "currency": currency,
      };
      var response = await _dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
          },
        ),
      );
      if (response.data != null) {
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      print("Error en _createPaymentIntent: $e");
      return null; // Asegúrate de devolver null en caso de error
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("Payment successful!");
    } catch (e) {
      print("Error al procesar el pago: $e");
    }
  }

  Future<void> postPayment({
    required String busName,
    required String originName,
    required String destinationName,
    required String ticketPrice,
  }) async {
    try {
      final response = await _dio.post(
        'https://track-my-route-web-services-cjf2ametdehhdshp.eastus-01.azurewebsites.net/api/v1/payments',
        data: {
          "busName": busName,
          "originName": originName,
          "destinationName": destinationName,
          "ticketPrice": ticketPrice,
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        print("Payment successfully posted to the backend!");
      } else {
        print("Failed to post payment: ${response.statusCode}");
      }
    } catch (e) {
      print("Error while posting payment: $e");
    }
  }
}
