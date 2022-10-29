import 'package:flutter/material.dart';

//import '../widgets/barraNavAbajo.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
          AppBar(title: const Text("Inicio"),
          centerTitle: true,
          backgroundColor: const Color(0xFF17B890)), // Reemplazar por appBar widget
      // Aqui va el cuerpo de la app
      body: const Center(
        
        child: Text(
          "Inicio",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
