import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/activity.dart';
import '../../model/entity/activity.dart';
import '../widgets/customAppBar.dart';
import '../../controller/catalog.dart';
import '../../model/entity/catalog.dart';

class NewCatalogPage extends StatefulWidget {
  late final CatalogEntity _catalogEntity;
  late final CatalogController _catalogController;
  final _pref = SharedPreferences.getInstance();
  late final ActivityEntity _activity;
  late final ActivityController _activitycontroller;
  final String action = "createCatalog";

  NewCatalogPage({super.key}) {
    _catalogEntity = CatalogEntity();
    _catalogController = CatalogController();
    _activitycontroller = ActivityController();
    _activity = ActivityEntity();
    _pref.then((pref) {
      _catalogEntity.user = pref.getString("uid");
      _activity.user = pref.getString("uid");
    });
  }

  @override
  State<NewCatalogPage> createState() => _NewCatalogPageState();
}

class _NewCatalogPageState extends State<NewCatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: 'TIPO PRENDA'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(child: _formaddclass(context)),
      ),
    );
  }

  Widget _formaddclass(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  color: const Color(0xFFFBFBF2),
                  child: SizedBox(
                    width: 350,
                    height: 450,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        _addclass((newValue) {
                          widget._catalogEntity.addclass = newValue!;
                        }),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    child: const Text("Guardar"),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        try {
                          final mess = ScaffoldMessenger.of(context);
                          final nav = Navigator.of(context);
                          await widget._catalogController
                              .save(widget._catalogEntity);
                          // TODO: Guardar los datos en la BD
                          mess.showSnackBar(
                            const SnackBar(
                              content: Text("Prenda registrada"),
                            ),
                          );
                          widget._activity.typeOfActivity = widget.action;
                          widget._activity.detailOfActivity =
                              widget._catalogEntity.addclass;
                          await widget._activitycontroller
                              .saveActivity(widget._activity);
                          // Volver a la pantalla anterior
                          nav.pop();
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Error: $e"),
                            ),
                          );
                        }
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _addclass(FormFieldSetter<String?> save) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              maxLength: 60,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                labelText:
                    'ingresa tipo de preda: Blusas, Camisas, Pantalones , Vestidos',
              ),
              onSaved: save,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Debes Ingresar tipo de prendas de la lista";
                }
                return null;
              },
            )),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
