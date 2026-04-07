import 'package:flutter/material.dart';
// Importamos la pantalla principal
import 'screens/home_screen.dart';

// Función principal de la app (punto de entrada)
void main() {
  // runApp inicia la aplicación y recibe el widget raíz
  runApp(const StoreApp());
}

// Widget principal de la aplicación
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Oculta la etiqueta "debug" en la esquina superior derecha
      debugShowCheckedModeBanner: false,

      // Título de la aplicación
      title: 'Fake Store App',

      // Tema general de la app
      theme: ThemeData(
        primarySwatch: Colors.blue, // color principal
        scaffoldBackgroundColor: Colors.grey[100], // fondo
      ),

      // Pantalla inicial de la app
      home: const HomeScreen(),
    );
  }
}