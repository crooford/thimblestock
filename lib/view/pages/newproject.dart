import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controller/projects.dart';
import '../../model/entity/projects.dart';
import '../widgets/customAppBar.dart';

class NewProject extends StatefulWidget {
  final _pref = SharedPreferences.getInstance();
  late final ProjectEntity _project;
  late final ProjectController _controller;
  
  NewProject({super.key}) {
    _project = ProjectEntity();
    _controller = ProjectController();
    _pref.then((pref) {
      _project.user = pref.getString("uid");
    });
  }

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
          child: _formProject(context),
        ),
      ),
    );
  }

  Widget _formProject(BuildContext context) {
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
                    height: 600,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        _projectName((newValue) {
                                          widget._project.projectName = newValue!;
                                        }),
                        _description((newValue) {
                                          widget._project.details = newValue!;
                                        }),
                        _dateProject((newValue) {
                                          widget._project.date = newValue!;
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

                        await widget._controller.save(widget._project);
                        mess.showSnackBar(
                          const SnackBar(
                            content: Text("Información del Proyecto registrada"),
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
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _projectName(FormFieldSetter<String?> save) {
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
                labelText: 'Nombre del Proyecto',
              ),
              onSaved: save,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Debes Ingresar un nombre para el proyecto";
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

  Widget _description(FormFieldSetter<String?> save) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        minLines: 4,
        maxLines: 5,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          labelText: 'Especificaciones',
        ),
        onSaved: save,
      ),
    );
  }

  Widget _dateProject(FormFieldSetter<DateTime?> save) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text("Fecha de entrega"),
          TableCalendar(
            firstDay: DateTime.utc(2010, 01, 01),
            lastDay: DateTime.utc(2040, 12, 31),
            focusedDay: DateTime.now(),
            
          ),
          
        ],
    
      ),
    );
  }
}
