import 'package:flutter/material.dart';

class OneClientPage extends StatefulWidget {
  const OneClientPage({super.key});

  @override
  State<OneClientPage> createState() => _OneClientPageState();
}

class _OneClientPageState extends State<OneClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Datos Cliente',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'assets/appbarlogo.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ), // Reemplazar por appBar widget
      // Aqui va el cuerpo de la app
    );
  }
}
