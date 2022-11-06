import 'package:flutter/material.dart';
import 'catalog.dart';
import 'clients.dart';
import 'home.dart';
import 'projects.dart';
import 'settings.dart';
import '../../icons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> get createState => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ClientsPage(),
    const CatalogPage(),
    const ProjectsPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFF17B890), width: 3.0),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (page) {
            setState(() {
              _currentPage = page;
            });
          },
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color(0xFF3185FC),
          unselectedItemColor: const Color(0xFF808080),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(ThimbleStockIcons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(ThimbleStockIcons.clientes),
              label: 'Clientes',
            ),
            BottomNavigationBarItem(
              icon: Icon(ThimbleStockIcons.catalogo),
              label: 'Catalogo',
            ),
            BottomNavigationBarItem(
              icon: Icon(ThimbleStockIcons.proyectos),
              label: 'Proyectos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ajustes',
            ),
          ],
        ),
      ),
    );
  }
}
