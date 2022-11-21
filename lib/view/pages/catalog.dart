import 'package:flutter/material.dart';
import 'package:thimblestock/view/pages/clients.dart';
import '../widgets/customAppBar.dart';
import 'onecatalog.dart';

//import '../widgets/barraNavAbajo.dart';\
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    var lista = _listCatalogo();
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
        onPressed: () {},
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
}
