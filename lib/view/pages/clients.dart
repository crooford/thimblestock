import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/controller/clients.dart';
import 'package:thimblestock/model/entity/clients.dart';
import '../../controller/activity.dart';
import '../../model/entity/activity.dart';
import '../widgets/customAppBar.dart';
import 'newclient.dart';
import 'oneclient.dart';
import 'updateclient.dart';

class ClientsPage extends StatefulWidget {
  final _pref = SharedPreferences.getInstance();
  late final ClientEntity _client;
  late final ActivityEntity _activity;
  late final ActivityController _activitycontroller;
  final String action = "deleteClient";

  ClientsPage({super.key}) {
    _client = ClientEntity();
    _activitycontroller = ActivityController();
    _activity = ActivityEntity();
    _pref.then((pref) {
      _client.user = pref.getString("uid");
      _activity.user = pref.getString("uid");
    });
  }

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  List<ClientEntity> _list = [];
  final _pref = SharedPreferences.getInstance();
  final _clientController = ClientController();
  final _activitycontroller = ActivityController();
  final _activity = ActivityEntity();

  @override
  void initState() {
    super.initState();

    _pref.then((pref) {
      _activity.user = pref.getString("uid");
      _listClients();
    });
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
                          : const NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/thimblestock1.appspot.com/o/clientDefault.jpg?alt=media&token=938d2907-f7d7-48f5-ae90-0f0d7eae8044'),
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
                              Navigator.pop(context);
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
                              Navigator.pop(context);
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
                              Navigator.pop(context);

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
          Navigator.pop(context);
        });
    Widget delete = TextButton(
      child: const Text("Borrar"),
      onPressed: () async {        
        try {
          final mess = ScaffoldMessenger.of(context);
          await _clientController.deleteclient(
              _list[index].clientAvatar, _list[index].clientId);
          mess.showSnackBar(
            const SnackBar(
              content: Text("El cliente ha sido borrado"),
            ),
          );
          // Almacenar el documento de la eliminacion de un cliente en la BD de Activities
          _activity.typeOfActivity = widget.action;
          _activity.detailOfActivity = _list[index].clientName;
          await _activitycontroller.saveActivity(_activity);

          setState(() {
            _listClients();            
          });
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error: $e"),
            ),
          );
        }
      },
    ); // set up the AlertDialog
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
