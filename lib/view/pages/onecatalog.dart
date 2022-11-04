import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';

class OneCatalogPage extends StatelessWidget {
  const OneCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _OneCatalogPageState(),
    );
  }
}

class _OneCatalogPageState extends StatelessWidget {
  _OneCatalogPageState({Key? key}) : super(key: key);

  final _blusas = [
    'assets/catalogo/blusas/blusas 1.png',
    'assets/catalogo/blusas/blusas 2.png',
    'assets/catalogo/blusas/blusas 3.png',
    'assets/catalogo/blusas/blusas 4.png',
    'assets/catalogo/blusas/blusas 5.png',
    'assets/catalogo/blusas/blusas 6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'PRENDAS',
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
      ),
      body: SingleChildScrollView(
        child: MasonryView(
          listOfItem: _blusas,
          numberOfColumn: 2,
          itemBuilder: (item) {
            return Image.asset(item);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_card),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OneCatalogPage(),
              ),
            );
          },
        ),
    );
  }
}

