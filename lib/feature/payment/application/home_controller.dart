import '../data/stripe_service.dart';

class HomeController {
  Future<void> makePayment() async {
    await StripeService.instance.makePayment();
  }

  Future<void> postPayment({
    required String busName,
    required String originName,
    required String destinationName,
    required String ticketPrice,
  }) async {
    await StripeService.instance.postPayment(
      busName: busName,
      originName: originName,
      destinationName: destinationName,
      ticketPrice: ticketPrice,
    );
  }
}
