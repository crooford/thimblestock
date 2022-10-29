import 'package:flutter/material.dart';




class ProjectsPage extends StatelessWidget {
  const ProjectsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Proyectos"),
          centerTitle: true,
          backgroundColor: const Color(0xFF17B890)), // Reemplazar por appBar widget
      // Aqui va el cuerpo de la app
      body: const Center(
        child: Text(
          "Proyectos",
          style: TextStyle(fontSize: 30),
        ),
      ),
       
    );
  }
}
