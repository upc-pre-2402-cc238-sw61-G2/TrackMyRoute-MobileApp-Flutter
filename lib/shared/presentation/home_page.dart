import 'package:flutter/material.dart';
import 'package:trackmyroute_flutter/features/profile/presentation/profile_screen.dart';

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
    const ProfileScreen(),        // Vista para el perfil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track My Route'),
        backgroundColor: Colors.teal,
      ),
      body: _views[_selectedIndex], // Muestra la vista seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Index de la pestaña seleccionada
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Cambia la pestaña seleccionada
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar Rutas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'), // Esta pestaña muestra el perfil
        ],
      ),
    );
  }
}

class SearchRoutesScreen extends StatelessWidget {
  const SearchRoutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar rutas...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Aquí puedes buscar rutas',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}