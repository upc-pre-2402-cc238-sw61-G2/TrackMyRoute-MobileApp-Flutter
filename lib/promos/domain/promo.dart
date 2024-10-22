class Promo {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  Promo({required this.id, required this.title, required this.description, required this.imageUrl});

  factory Promo.fromJson(Map<String, dynamic> json) {
    return Promo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
