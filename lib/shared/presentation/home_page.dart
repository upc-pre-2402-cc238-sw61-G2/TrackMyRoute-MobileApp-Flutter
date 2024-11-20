import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/features/payment/presentation/pages/payment_page.dart';
import 'package:trackmyroute_flutter/features/profile/presentation/profile_screen.dart';
import 'package:trackmyroute_flutter/features/promos/presentation/pages/promo_list_page.dart';
import 'package:trackmyroute_flutter/features/tracking/presentation/pages/search_routes_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0; // Para controlar la pestaña seleccionada

  // Lista de widgets para las diferentes vistas
  final List<Widget> _views = [
    const SearchRoutesScreen(), 
    const PromoListPage(),
    const PaymentPage(),  
    const ProfileScreen(),     // Vista para el perfil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row (
          children: [
            Image.asset(
              'assets/images/1024.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Track My Route', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      body: _views[_selectedIndex], // Muestra la vista seleccionada
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex, // Index de la pestaña seleccionada
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Cambia la pestaña seleccionada
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Buscar Rutas', backgroundColor: Colors.teal),
          BottomNavigationBarItem(icon: Icon(Icons.discount), label: 'Promociones', backgroundColor: Colors.teal),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pagos', backgroundColor: Colors.teal),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil', backgroundColor: Colors.teal), // Esta pestaña muestra el perfil
        ],
      ),
    );
  }
}