import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';
import 'newclient.dart';

//import '../widgets/barraNavAbajo.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

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
    final lista = _listClients();
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar:
            CusAppBar(pageTitle: "Clientes"),

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
                          builder: (context) => NewClientPage(),
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
                builder: (context) => NewClientPage(),
              ),
            );
          },
        ),
      ),
    );
  }

  List<String> _listClients() {
    //TODO:  Base de Datos

    return List<String>.generate(
      5,
      (index) => "Cliente ${index + 1}",
    );
  }
}
