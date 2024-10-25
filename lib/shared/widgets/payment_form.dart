import 'package:flutter/material.dart';
import '../../features/payment/application/home_controller.dart';

class PaymentForm extends StatelessWidget {
  final HomeController homeController;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _originNameController = TextEditingController();
  final TextEditingController _destinationNameController =
      TextEditingController();
  final TextEditingController _ticketPriceController = TextEditingController();

  PaymentForm({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTextFormField(_busNameController, "Bus Name"),
            _buildTextFormField(_originNameController, "Origin Name"),
            _buildTextFormField(_destinationNameController, "Destination Name"),
            _buildTextFormField(_ticketPriceController, "Ticket Price",
                isNumber: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Intentar hacer el pago
                  await homeController.makePayment(); // Llamar a makePayment

                  // Aquí puedes verificar el estado del pago y proceder
                  // a restablecer los campos y el formulario.
                  await homeController.postPayment(
                    busName: _busNameController.text,
                    originName: _originNameController.text,
                    destinationName: _destinationNameController.text,
                    ticketPrice: _ticketPriceController.text,
                  );

                  // Restablecer el formulario después de un pago exitoso
                  _resetForm();
                }
              },
              child: const Text("Submit Payment"),
            ),
          ],
        ),
      ),
    );
  }

  void _resetForm() {
    _busNameController.clear();
    _originNameController.clear();
    _destinationNameController.clear();
    _ticketPriceController.clear();
    _formKey.currentState?.reset();
  }

  Widget _buildTextFormField(TextEditingController controller, String label,
      {bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (value) => value!.isEmpty ? "Please enter $label" : null,
    );
  }
}
