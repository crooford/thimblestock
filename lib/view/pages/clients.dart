import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/controller/clients.dart';
import 'package:thimblestock/model/entity/clients.dart';

import '../widgets/customAppBar.dart';
import 'newclient.dart';
import 'oneclient.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  List<ClientEntity> _list = [];
  final _pref = SharedPreferences.getInstance();
  final _clientController = ClientController();

  @override
  void initState() {
    super.initState();
    _listClients();
  }

  @override
  Widget build(BuildContext context) {
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
                  itemCount: _list.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: const CircleAvatar(),
                    title: Text(_list[index].clientName!),
                    subtitle: Text(_list[index].clientPhone!),
                    trailing: IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () {
                        // Realizar llamada Telefonica al cliente
                        _callPhone(_list[index].clientPhone!);
                      },
                    ),
                    onTap: () {
                      // redirige a los datos del cliente especifico
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OneClientPage(client: _list[index]),
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
          child: const Icon(Icons.person_add_alt_rounded),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewClientPage(),
              ),
            );
            if (!mounted) return;
            _listClients();
          },
        ));
  }

  void _listClients() {
    _pref.then((pref) {
      var id = pref.getString("uid") ?? "";
      _clientController.listAll(id).then((value) {
        setState(() {
          _list = value;
        });
      });
    });
  }

  _callPhone(String s) async {
    await FlutterPhoneDirectCaller.callNumber(s);
  }
}
