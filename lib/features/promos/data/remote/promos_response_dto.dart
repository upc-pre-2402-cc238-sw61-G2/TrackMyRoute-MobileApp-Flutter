import 'package:trackmyroute_flutter/features/promos/domain/promo.dart';

class PromosResponseDto {
  final List<Promo> promos;

  PromosResponseDto({required this.promos});

  factory PromosResponseDto.fromJson(List<dynamic> json) {
    List<Promo> promosList = json.map((promo) => Promo.fromJson(promo)).toList();
    return PromosResponseDto(promos: promosList);
  }
}