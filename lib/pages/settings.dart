import 'package:flutter/material.dart';

//import '../widgets/barraNavAbajo.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Ajustes"),
          centerTitle: true,
          backgroundColor: const Color(0xFF17B890)), // Reemplazar por appBar widget
      // Aqui va el cuerpo de la app
      body: const Center(
        child: Text(
          "Ajustes",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
