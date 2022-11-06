import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/customAppBar.dart';

class NewProject extends StatefulWidget {
  const NewProject({super.key});

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: 'Proyecto'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: _formclient(context),
        ),
      ),
      
    );
  }
  Widget _formclient(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Center(
              child:Column(children: [
              Card(
                  elevation: 5,
                  color: const Color(0xFFFBFBF2),
                  child: SizedBox(
                            width: 350,
                            height: 600,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                _clientName(),
                                _description(),
                                _dateProject(),

                                
                                
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text("Guardar"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // TODO: Guardar los datos en la BD

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Proyecto registrado"),
                          ),
                        );
                        // Volver a la pantalla anterior
                        Navigator.pop(context);
                      }
                    },
                  ),
              
              ],
            ),
          ),],
        
        ),
      );
  }
  Widget _clientName() {
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
                labelText: 'Nombre',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Debes Ingresar un nombre";
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
  Widget _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Flexible(
          child: TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            minLines: 6,
            maxLines: 10,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                labelText: 'Especificaciones',
              ),
          ),
        ),
    );
  }

  Widget _dateProject(){
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(children:[
        const SizedBox(height: 10,),
        const Text("Fecha de entrega"),
        TableCalendar(
          firstDay: DateTime.utc(2010,01,01),
          lastDay: DateTime.utc(2040,12,31),
          focusedDay: DateTime.now(),
        ),
      ],),
    );
  }
}