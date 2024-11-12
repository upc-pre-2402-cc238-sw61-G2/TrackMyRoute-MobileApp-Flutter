import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/features/promos/data/remote/promo_service.dart';
import 'package:trackmyroute_flutter/features/promos/data/remote/promos_response_dto.dart';
import 'package:trackmyroute_flutter/features/promos/presentation/widgets/promo_card.dart';

class PromoListPage extends StatefulWidget {
  const PromoListPage({super.key});

  @override
  _PromoListPageState createState() => _PromoListPageState();
}

class _PromoListPageState extends State<PromoListPage> {
  late Future<PromosResponseDto?> futurePromos;

  @override
  void initState() {
    super.initState();
    futurePromos = PromoService().getPromos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Promociones', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: FutureBuilder<PromosResponseDto?>(
        future: futurePromos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final promos = snapshot.data!.promos;

            return ListView.builder(
              itemCount: promos.length,
              itemBuilder: (context, index) {
                final promo = promos[index];
                return PromoCard(promo: promo);
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
