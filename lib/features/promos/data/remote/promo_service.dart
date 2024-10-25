import 'dart:convert';
import 'promos_response_dto.dart';
import 'package:trackmyroute_flutter/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class PromoService {
  Future<PromosResponseDto?> getPromos() async {
    try {
      final response = await http.get(Uri.parse('${AppConstants.baseUrl}promo'));

      if (response.statusCode == 200) {
        // Decodificar el JSON de la respuesta y convertirlo en un objeto PromosResponseDto
        return PromosResponseDto.fromJson(jsonDecode(response.body)); // Utiliza jsonDecode aquí
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al hacer la solicitud: $e');
      return null;
    }
  }
}