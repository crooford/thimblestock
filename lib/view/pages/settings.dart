import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';

//import '../widgets/barraNavAbajo.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.email, required this.name});
  final String email;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CusAppBar(pageTitle: "Ajustes"), // Reemplazar por appBar widget
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