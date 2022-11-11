import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';
import 'newclient.dart';
import 'oneclient.dart';

//import '../widgets/barraNavAbajo.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key, required this.email, required this.name});
  final String email;
  final String name;

  @override
  Widget build(BuildContext context) {
    final lista = _listClients();
    return Scaffold(
        appBar: CusAppBar(pageTitle: "Clientes"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Listado de Clientes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: const CircleAvatar(),
                    title: Text(lista[index]),
                    subtitle: const Text("318 000 000"),
                    trailing: IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () {
                        // TODO Realizar la llamada Telefonica
                      },
                    ),
                    onTap: () {
                      // TODO: Debe redirigir a los datos del cliente especifico

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OneClientPage(email: email),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_card),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewClientPage(email),
              ),
            );
          },
        ));
  }

  List<String> _listClients() {
    //TODO:  Base de Datos

    return List<String>.generate(
      5,
      (index) => "Cliente ${index + 1}",
    );
  }
}
