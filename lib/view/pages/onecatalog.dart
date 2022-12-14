import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:thimblestock/model/entity/catalog.dart';
import 'package:thimblestock/view/pages/clients.dart';

import '../widgets/customAppBar.dart';

class OneCatalogPage extends StatefulWidget {
  dynamic lista;
  CatalogEntity catalogEntity;
  OneCatalogPage(this.lista, {super.key, required this.catalogEntity});

  @override
  State<OneCatalogPage> createState() => _OneCatalogPageState();
}

class _OneCatalogPageState extends State<OneCatalogPage> {
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
      appBar: CusAppBar(pageTitle: widget.catalogEntity.addclass!),
      body: SingleChildScrollView(
        child: catalogos(widget.lista),
        // MasonryView(

        //   listOfItem: _blusas,
        //   numberOfColumn: 2,
        //   itemBuilder: (item) {
        //     return Image.asset(item);
        //   },
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_basket_rounded),
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
          return Card(
            elevation: 5,
            color: const Color(0xFFFBFBF2),
            child: Image.asset(item),
          );
        },
      );
    }
    if ('Camisas' == lista) {
      return MasonryView(
        listOfItem: _camisas,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Card(
            elevation: 5,
            color: const Color(0xFFFBFBF2),
            child: Image.asset(item),
          );
        },
      );
    }
    if ('Pantalones' == lista) {
      return MasonryView(
        listOfItem: _pantalones,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Card(
            elevation: 5,
            color: const Color(0xFFFBFBF2),
            child: Image.asset(item),
          );
        },
      );
    }
    if ('Vestidos' == lista) {
      return MasonryView(
        listOfItem: _vestidos,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Card(
            elevation: 5,
            color: const Color(0xFFFBFBF2),
            child: Image.asset(item),
          );
        },
      );
    }
  }
}
