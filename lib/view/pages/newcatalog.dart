import 'package:flutter/material.dart';
import '../widgets/customAppBar.dart';
import '../../controller/catalog.dart';
import '../../model/entity/catalog.dart';

class NewCatalogPage extends StatelessWidget {
  late final CatalogEntity _catalogEntity;
  late final CatalogController _catalogController;

  NewCatalogPage({super.key}) {
    _catalogEntity = CatalogEntity();
    _catalogController = CatalogController();
  }

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
                        _addclass(),
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
                          await _catalogController.save(_catalogEntity);
                          // TODO: Guardar los datos en la BD
                          mess.showSnackBar(
                            const SnackBar(
                              content: Text("Prenda registrada"),
                            ),
                          );
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

  Widget _addclass() {
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