import 'package:flutter/material.dart';

import '../icons.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: todo
      //TODO: Incluir Appbar con estilo modificado
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF17B890),
        title: const Text("Dashboard"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle:
            const TextStyle(color: Colors.black, fontSize: 14),
        backgroundColor: const Color(0xFF084A76),
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(ThimbleStockIcons.home, color: Color(0xFF17B890)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(ThimbleStockIcons.clientes, color: Color(0xFF17B890)),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(ThimbleStockIcons.catalogo, color: Color(0xFF17B890)),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(ThimbleStockIcons.proyectos, color: Color(0xFF17B890)),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color(0xFF17B890)),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
