import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/features/promos/data/remote/promo_service.dart';
import 'package:trackmyroute_flutter/features/promos/data/remote/promos_response_dto.dart';
import 'package:trackmyroute_flutter/features/promos/domain/promo.dart';
import 'package:trackmyroute_flutter/features/promos/presentation/widgets/promo_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PromoListPage extends StatefulWidget {
  const PromoListPage({super.key});

  @override
  _PromoListPageState createState() => _PromoListPageState();
}

class _PromoListPageState extends State<PromoListPage> {
  late Future<PromosResponseDto?> futurePromos;
  List<Promo> allPromos = [];
  List<Promo> filteredPromos = [];
  Set<String> favoritePromoIds = {}; // IDs de las promociones favoritas
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadFavorites(); // Cargar favoritos al iniciar
    futurePromos = PromoService().getPromos();
    futurePromos.then((promosResponse) {
      if (promosResponse != null) {
        setState(() {
          allPromos = promosResponse.promos;
          filteredPromos = allPromos;
        });
      }
    });
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList('favoritePromoIds') ?? [];
    setState(() {
      favoritePromoIds = favoriteIds.toSet();
    });
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoritePromoIds', favoritePromoIds.toList());
  }

  void _toggleFavorite(String promoId) {
    setState(() {
      if (favoritePromoIds.contains(promoId)) {
        favoritePromoIds.remove(promoId);
      } else {
        favoritePromoIds.add(promoId);
      }
      _saveFavorites(); // Guardar favoritos después de cada cambio
    });
  }

  bool _isFavorite(String promoId) {
    return favoritePromoIds.contains(promoId);
  }

  void _filterPromos(String query) {
    final filteredList = allPromos.where((promo) {
      final promoTitle = promo.title.toLowerCase();
      final input = query.toLowerCase();
      return promoTitle.contains(input);
    }).toList();

    setState(() {
      filteredPromos = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar promociones',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: _filterPromos,
            ),
          ),
          Expanded(
            child: FutureBuilder<PromosResponseDto?>(
              future: futurePromos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && filteredPromos.isNotEmpty) {
                  return ListView.builder(
                    itemCount: filteredPromos.length,
                    itemBuilder: (context, index) {
                      final promo = filteredPromos[index];
                      final isFavorite = _isFavorite(promo.id);

                      return PromoCard(
                        promo: promo,
                        isFavorite: isFavorite,
                        onFavoriteToggle: () => _toggleFavorite(promo.id),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No se encontraron promociones'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}