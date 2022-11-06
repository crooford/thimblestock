import 'package:flutter/material.dart';
import 'package:thimblestock/view/pages/clients.dart';
import '../widgets/customAppBar.dart';
import 'onecatalog.dart';

//import '../widgets/barraNavAbajo.dart';\
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Está seguro?'),
      content: const Text('Desea cerrar Thimblestock?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Si'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var lista = _listCatalogo();
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar:
            CusAppBar(pageTitle: "Catalogo"), // Reemplazar por appBar widget
        // Aqui va el cuerpo de la app
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) => ListTile(
                  trailing: iconscatalogo(lista[index]),
                  //   IconButton(
                  //   icon: Image.asset(
                  //     'assets/catalogo/blusa.png',
                  //     fit: BoxFit.cover,
                  //   ),
                  //   onPressed: () {},
                  // ),
                  title: Text(
                    lista[index],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OneCatalogPage(lista[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_card),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ClientsPage(),
              ),
            );
          },
        ),
      ),
    );
  }

  List _listCatalogo() {
    List lista = ['Blusas', 'Camisas', 'Pantalones', 'Vestidos'];
    // return List<String>.generate(
    //   5,
    //   (index) => "Blusas, Polos, Jeans, Pantalones, chaquetas",
    // );
    return lista;
  }

  iconscatalogo(lista) {
    if('Blusas' == lista) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/blusa.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
    if('Camisas' == lista) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/camisa.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
    if('Pantalones' == lista) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/pantalones.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
    if('Vestidos' == lista) {
      return IconButton(
        icon: Image.asset(
          'assets/catalogo/vestido.png',
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      );
    }
  }

}
