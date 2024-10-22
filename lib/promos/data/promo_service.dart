import 'dart:convert';
import 'promos_response_dto.dart';
import 'package:trackmyroute_flutter/promos/common/constants.dart';
import 'package:http/http.dart' as http;

class PromoService {
  Future<PromosResponseDto?> getPromos() async {
    try {
      final response = await http.get(Uri.parse('${Constants.baseUrl}promos'));

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