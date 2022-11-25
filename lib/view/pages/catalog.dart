import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/model/entity/catalog.dart';
import '../../controller/catalog.dart';
import '../../controller/projects.dart';
import '../widgets/customAppBar.dart';
import 'newcatalog.dart';
import 'onecatalog.dart';

//import '../widgets/barraNavAbajo.dart';\
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});
  @override
  State<CatalogPage> createState() => _CatalogPageState();
}
class _CatalogPageState extends State<CatalogPage>{
  List<CatalogEntity> _listCatalog = [];
  final _pref = SharedPreferences.getInstance();
  final _CatalogController = CatalogController();

  @override
  void initState() {
    super.initState();
    _listCatalogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(
        pageTitle: "Catalogo"
        ),
      // Aqui va el cuerpo de la app
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listCatalog.length,
              itemBuilder: (context, index) => ListTile(

                title: Text(_listCatalog[index].addclass!),
                trailing: iconscatalogo(_listCatalog[index].addclass!),
                //   IconButton(
                //   icon: Image.asset(
                //     'assets/catalogo/blusa.png',
                //     fit: BoxFit.cover,
                //   ),
                //   onPressed: () {},
                // ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneCatalogPage(_listCatalog[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_basket_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewCatalogPage(),
            )
          );
        },
      ),
    );
  }

  void _listCatalogo() {
  _pref.then((pref) {
      var id = pref.getString("uid") ?? "";
      _CatalogController.listAll(id).then((value) {
        setState(() {
          _listCatalog = value;
        });
      });
    });
  }
    // List lista = ['Blusas', 'Camisas', 'Pantalones', 'Vestidos'];
    // // return List<String>.generate(
    // //   5,
    // //   (index) => "Blusas, Polos, Jeans, Pantalones, chaquetas",
    // // );
    // return lista;
  }

  iconscatalogo(_listCatalog) {
    if ('Blusas' == _listCatalog) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/blusa.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
    if ('Camisas' == _listCatalog) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/camisa.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
    if ('Pantalones' == _listCatalog) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/pantalones.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
    if ('Vestidos' == _listCatalog) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/vestido.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
}
