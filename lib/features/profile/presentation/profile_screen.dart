import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.teal, // Color de la AppBar
      ),
      body: const Center(
        child: ProfileContent(), // Contenido del perfil centrado
      ),
    );
  }
}

// Widget separado para el contenido del perfil
class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card( // Usamos un Card para darle un aspecto profesional
        elevation: 4, // Sombra del Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Bordes redondeados
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Tamaño mínimo para la columna
            crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
            children: [
              // Imagen de perfil
              const Center(
                child:  CircleAvatar(
                  radius: 50, // Tamaño del círculo
                  backgroundImage: NetworkImage(
                    'https://s1.elespanol.com/2017/07/14/ciencia/medio-ambiente/medio_ambiente_231238002_39634878_854x640.jpg', // URL de la imagen
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espacio entre la imagen y el texto

              // Nombre
              const Text(
                'Juan Pérez',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10), // Espacio entre los campos

              // Descripción breve
              const Text(
                'Desarrollador de software con experiencia en Flutter y Dart. Apasionado por crear aplicaciones móviles intuitivas.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20), // Espacio entre la descripción y los campos

              // Correo electrónico
              const Text(
                'Correo: juan.perez@example.com',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 10), // Espacio entre los campos

              // Número de teléfono
              const Text(
                'Teléfono: +51 987 654 321',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 10), // Espacio entre los campos

              // Contraseña
              const Text(
                'Contraseña: ********',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20), // Espacio entre los campos

              // Habilidades
              const Text(
                'Habilidades:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                '- Flutter\n- Dart\n- Desarrollo web\n- API REST\n- SQL',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20), // Espacio entre las habilidades y el botón

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
                    onPressed: () {                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {
                    },
                  ),
                  
                ],
              ),
              const SizedBox(height: 20), // Espacio entre las redes sociales y el botón

            ],
          ),
        ),
      ),
    );
  }

}
