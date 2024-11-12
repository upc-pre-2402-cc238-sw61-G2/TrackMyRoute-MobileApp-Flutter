import 'package:flutter/material.dart';

class SearchRoutesScreen extends StatelessWidget {
  const SearchRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
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
        const Expanded(
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