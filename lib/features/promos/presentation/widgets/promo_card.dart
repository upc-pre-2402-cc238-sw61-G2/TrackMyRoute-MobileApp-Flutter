import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/features/promos/domain/promo.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const PromoCard({
    super.key,
    required this.promo,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

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
            : null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                promo.title,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoriteToggle,
            ),
          ],
        ),
        subtitle: Text(
          promo.description,
          style: const TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}