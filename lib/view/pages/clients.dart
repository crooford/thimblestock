import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/controller/clients.dart';
import 'package:thimblestock/model/entity/clients.dart';
import 'package:thimblestock/view/pages/dashboard.dart';
import 'package:thimblestock/view/pages/home.dart';

import '../widgets/customAppBar.dart';
import 'newclient.dart';
import 'oneclient.dart';
import 'updateclient.dart';

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
          padding: const EdgeInsets.all(16.0),
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
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: _list[index].clientAvatar != null
                          ? NetworkImage(_list[index].clientAvatar!)
                          : const AssetImage('assets/clientDefault.jpg')
                              as ImageProvider,
                    ),
                    title: Text(_list[index].clientName!),
                    subtitle: Text(_list[index].clientPhone!),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: InkWell(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.phone,
                                  color: Color(0xFF17B890),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Llamar cliente"),
                              ],
                            ),
                            onTap: () {
                              _callPhone(_list[index].clientPhone!);
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: InkWell(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.edit,
                                  color: Color(0xFF17B890),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Editar cliente"),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateClientPage(_list[
                                      index]), // añadir logica para enviar datos a formulario
                                ),
                              );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: InkWell(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.delete_forever_rounded,
                                  color: Color(0xFF17B890),
                                ),
                                Text("Borrar cliente"),
                              ],
                            ),
                            onTap: () async {
                              warningDelete(context, index);
                            },
                          ),
                        ),
                      ],
                      child: const Icon(
                        Icons.more_horiz_rounded,
                        size: 30.0,
                      ),
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

  warningDelete(BuildContext context, index) {
    // set up the buttons
    Widget cancel = TextButton(
        child: const Text("Cancelar"),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const DashboardPage(), // por ahora redirige a homepage
            ),
          );
        });
    Widget delete = TextButton(
      child: const Text("Borrar"),
      onPressed: () async {
        try {
          final mess = ScaffoldMessenger.of(context);
          final nav = Navigator.of(context);

          await _clientController.deleteclient(_list[index].clientId);
          mess.showSnackBar(
            const SnackBar(
              content: Text("El cliente ha sido borrado"),
            ),
          );
          nav.pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  const DashboardPage(), // por ahora redirige a homepage
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error: $e"),
            ),
          );
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Advertencia"),
      content: Text(
          "Va a borrar al cliente ${_list[index].clientName}. Esta acción es irreversible"),
      actions: [
        cancel,
        delete,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
