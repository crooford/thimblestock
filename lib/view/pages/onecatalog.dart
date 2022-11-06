import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:thimblestock/view/pages/clients.dart';

import '../widgets/customAppBar.dart';

class OneCatalogPage extends StatelessWidget {
  dynamic lista;
  OneCatalogPage(this.lista, {Key? key}) : super(key: key);
  final _blusas = [
    'assets/catalogo/blusas/blusas 1.png',
    'assets/catalogo/blusas/blusas 2.png',
    'assets/catalogo/blusas/blusas 3.png',
    'assets/catalogo/blusas/blusas 4.png',
    'assets/catalogo/blusas/blusas 5.png',
    'assets/catalogo/blusas/blusas 6.png',
  ];
  final _camisas = [
    'assets/catalogo/camisas/camisas 1.png',
    'assets/catalogo/camisas/camisas 2.png',
    'assets/catalogo/camisas/camisas 3.png',
    'assets/catalogo/camisas/camisas 4.png',
    'assets/catalogo/camisas/camisas 5.png',
  ];
  final _pantalones = [
    'assets/catalogo/pantalones/pantalones 1.png',
    'assets/catalogo/pantalones/pantalones 2.png',
    'assets/catalogo/pantalones/pantalones 3.png',
    'assets/catalogo/pantalones/pantalones 4.png',
    'assets/catalogo/pantalones/pantalones 5.png',
  ];
  final _vestidos = [
    'assets/catalogo/vestidos/vestidos 1.png',
    'assets/catalogo/vestidos/vestidos 2.png',
    'assets/catalogo/vestidos/vestidos 3.png',
    'assets/catalogo/vestidos/vestidos 4.png',
    'assets/catalogo/vestidos/vestidos 5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: 'Prendas'),
      body: SingleChildScrollView(
        child: catalogos(lista),
        // MasonryView(

        //   listOfItem: _blusas,
        //   numberOfColumn: 2,
        //   itemBuilder: (item) {
        //     return Image.asset(item);
        //   },
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo_outlined),
        onPressed: () {},
      ),
    );
  }

  catalogos(lista) {
    if ('Blusas' == lista) {
      return MasonryView(
        listOfItem: _blusas,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Image.asset(item);
        },
      );
    }
    if ('Camisas' == lista) {
      return MasonryView(
        listOfItem: _camisas,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Image.asset(item);
        },
      );
    }
    if ('Pantalones' == lista) {
      return MasonryView(
        listOfItem: _pantalones,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Image.asset(item);
        },
      );
    }
    if ('Vestidos' == lista) {
      return MasonryView(
        listOfItem: _vestidos,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Image.asset(item);
        },
      );
    }
  }
}
