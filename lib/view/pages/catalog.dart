import 'package:flutter/material.dart';
import 'onecatalog.dart';

//import '../widgets/barraNavAbajo.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lista = _listCatalogo();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Catalogo',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                  icon: Image.asset(
                    'assets/catalogo/blusa.png',
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {},
                ),
                title: Text(
                  lista[index],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OneCatalogPage(),
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
              builder: (context) => const OneCatalogPage(),
            ),
          );
        },
      ),
      
    );
  }

  List _listCatalogo() {
    List lista = ['Blusas', 'Camisas', 'Jeans', 'Vestidos'];
    // return List<String>.generate(
    //   5,
    //   (index) => "Blusas, Polos, Jeans, Pantalones, chaquetas",
    // );
    return lista;
    
  }
}