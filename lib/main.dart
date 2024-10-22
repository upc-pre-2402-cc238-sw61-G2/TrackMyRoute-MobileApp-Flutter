import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/promos/data/promo_service.dart';
import 'package:trackmyroute_flutter/promos/data/promos_response_dto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PromoListScreen(),
    );
  }
}

class PromoListScreen extends StatefulWidget {
  const PromoListScreen({super.key});

  @override
  _PromoListScreenState createState() => _PromoListScreenState();
}

class _PromoListScreenState extends State<PromoListScreen> {
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
        title: const Text('Promociones'),
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
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(promo.imageUrl, width: 100, fit: BoxFit.cover),
                    title: Text(promo.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(promo.description),
                  ),
                );
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