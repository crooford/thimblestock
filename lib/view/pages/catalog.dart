import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/model/entity/catalog.dart';
import '../../controller/activity.dart';
import '../../controller/catalog.dart';
import '../../controller/projects.dart';
import '../../model/entity/activity.dart';
import '../widgets/customAppBar.dart';
import 'newcatalog.dart';
import 'onecatalog.dart';

//import '../widgets/barraNavAbajo.dart';\
class CatalogPage extends StatefulWidget {
 final _pref = SharedPreferences.getInstance();
  late final CatalogEntity _catalogEntity;
  late final ActivityEntity _activity;
  late final ActivityController _activitycontroller;
  final String action = "deleteClient";


  CatalogPage({super.key}) {   
    _catalogEntity = CatalogEntity();
    _activitycontroller = ActivityController();
    _activity = ActivityEntity();
    _pref.then((pref) {
      _catalogEntity.user = pref.getString("uid");
      _activity.user = pref.getString("uid");
    });}


  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<CatalogEntity> lista = [];
  final _pref = SharedPreferences.getInstance();
  final _catalogController = CatalogController();
  final _activitycontroller = ActivityController();
  final _activity = ActivityEntity();

  @override
  void initState() {
    super.initState();
    _listCatalogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: "Catalogo"),
      // Aqui va el cuerpo de la app
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(lista[index].addclass!),
                trailing: iconscatalogo(lista[index].addclass!),
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
                      builder: (context) => OneCatalogPage(lista, catalogEntity: lista[index] ),
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
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewCatalogPage(),
              ));
          setState(() {
            _listCatalogo();
          });
        },
      ),
    );
  }

  void _listCatalogo() {
    _pref.then((pref) {
      var id = pref.getString("uid") ?? "";
      _catalogController.listAll(id).then((value) {
        setState(() {
          lista = value;
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

iconscatalogo(lista) {
  if ('Blusas' == lista) {
    return IconButton(
      icon: Image.asset(
        'assets/catalogo/blusa.png',
        fit: BoxFit.cover,
      ),
      onPressed: () {},
    );
  }
  if ('Camisas' == lista) {
    return IconButton(
      icon: Image.asset(
        'assets/catalogo/camisa.png',
        fit: BoxFit.cover,
      ),
      onPressed: () {},
    );
  }
  if ('Pantalones' == lista) {
    return IconButton(
      icon: Image.asset(
        'assets/catalogo/pantalones.png',
        fit: BoxFit.cover,
      ),
      onPressed: () {},
    );
  }
  if ('Vestidos' == lista) {
    return IconButton(
      icon: Image.asset(
        'assets/catalogo/vestido.png',
        fit: BoxFit.cover,
      ),
      onPressed: () {},
    );
  }
}
