import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: ProfileContent(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController(text: 'Juan Pérez');
  final TextEditingController _emailController = TextEditingController(text: 'juan.perez@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+51 987 654 321');
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar en perfil...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
                onChanged: (value) {
                  // Puedes implementar búsqueda de contenido si es necesario
                  print('Buscando: $value');
                },
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: const NetworkImage(
                          'https://s1.elespanol.com/2017/07/14/ciencia/medio-ambiente/medio_ambiente_231238002_39634878_854x640.jpg',
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.edit, color: Colors.white),
                                onPressed: () {
                                  // Aquí puedes implementar la lógica para cambiar la imagen de perfil
                                  debugPrint("Cambiar imagen de perfil");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Nombre
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      enabled: _isEditing,
                    ),
                    const SizedBox(height: 10),

                    // Correo electrónico
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      enabled: _isEditing,
                    ),
                    const SizedBox(height: 10),

                    // Número de teléfono
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Teléfono',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      enabled: _isEditing,
                    ),
                    const SizedBox(height: 20),

                    // Contraseña
                    const Text(
                      'Contraseña: ********',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),

                    // Redes sociales
                    const Text(
                      'Redes Sociales:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.linked_camera, color: Colors.blue),
                          onPressed: () {
                            debugPrint("Abrir LinkedIn");
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.facebook, color: Colors.blue),
                          onPressed: () {
                            debugPrint("Abrir Facebook");
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Botones de edición y guardado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isEditing = !_isEditing;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                          ),
                          child: Text(_isEditing ? 'Cancelar' : 'Editar'),
                        ),
                        if (_isEditing)
                          ElevatedButton(
                            onPressed: () {
                              // Aquí puedes implementar la lógica para guardar cambios
                              debugPrint("Guardar cambios");
                              setState(() {
                                _isEditing = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                            ),
                            child: const Text('Guardar'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

