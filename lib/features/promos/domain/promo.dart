class Promo {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;  // Cambiado a opcional

  Promo({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,  // Opcional ahora
  });

  factory Promo.fromJson(Map<String, dynamic> json) {
    return Promo(
      id: json['id'].toString(),
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'], // Puede ser null si no existe en la respuesta
    );
  }
}