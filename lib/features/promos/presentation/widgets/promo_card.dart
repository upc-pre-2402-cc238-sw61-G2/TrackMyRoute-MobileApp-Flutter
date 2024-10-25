import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/features/promos/domain/promo.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  const PromoCard({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: promo.imageUrl != null && promo.imageUrl!.isNotEmpty
            ? Image.network(
                promo.imageUrl!,
                width: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                },
              )
            : null,  // Si no hay imagen, el 'leading' queda vacío
        title: Text(
          promo.title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        subtitle: Text(
          promo.description,
          style: const TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}