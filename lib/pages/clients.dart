import 'package:flutter/material.dart';

//import '../widgets/barraNavAbajo.dart';


class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:
          AppBar(
          
        automaticallyImplyLeading: false,
        title: const Text(
          'Clientes',
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
      body: const Center(
        child: Text(
          "Clientes",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}