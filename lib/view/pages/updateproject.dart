import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/activity.dart';
import '../../controller/projects.dart';
import '../../model/entity/activity.dart';
import '../../model/entity/projects.dart';
import '../widgets/customAppBar.dart';


class UpdateProjectPage extends StatefulWidget {
  final _pref = SharedPreferences.getInstance();
  late final ProjectEntity _project;
  late final ProjectController _controller;
  late final ActivityEntity _activity;
  late final ActivityController _activitycontroller;
  final String action = "updateProject";

  UpdateProjectPage(ProjectEntity project, {super.key}) {
    _project = project;
    _controller = ProjectController();
    _activitycontroller = ActivityController();
    _activity = ActivityEntity();
    _pref.then((pref) {
      _project.user = pref.getString("uid");
      _activity.user = pref.getString("uid");
    });
  }

  @override
  State<UpdateProjectPage> createState() => _UpdateProjectPageState();
}

class _UpdateProjectPageState extends State<UpdateProjectPage> {
  late TextEditingController _date = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: 'Actualizar Información'),
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
                    height: 400,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        _dateProject((newValue) {
                          widget._project.date = newValue!;
                        }, context),
                        const SizedBox(
                          height: 10,
                        ),
                        _clientName((newValue) {
                          widget._project.clientName = newValue!;
                        }),
                        _projectName((newValue) {
                          widget._project.projectName = newValue!;
                        }),
                        _description((newValue) {
                          widget._project.details = newValue!;
                        }),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    try {
                      final mess = ScaffoldMessenger.of(context);
                      final nav = Navigator.of(context);

                      await widget._controller.save(widget._project);
                      mess.showSnackBar(
                        const SnackBar(
                          content: Text("Información de proyecto actualizada"),
                        ),
                      );

                        widget._activity.typeOfActivity = widget.action;
                        widget._activity.detailOfActivity =
                            widget._project.projectName;
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
                  },
                  child: const Text("Guardar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _clientName(FormFieldSetter<String?> save) {
    String inVal;
    widget._project.clientName == "-"
        ? inVal = ""
        : inVal = widget._project.clientName!;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              initialValue: inVal,
              maxLength: 60,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                labelText: 'Nombre del Cliente',
              ),
              onSaved: save,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Debe Ingresar un nombre de cliente para el proyecto";
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

  Widget _projectName(FormFieldSetter<String?> save) {
    String inVal;
    widget._project.projectName == "-"
        ? inVal = ""
        : inVal = widget._project.projectName!;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              initialValue: inVal,
              maxLength: 60,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                labelText: 'Nombre del Proyecto',
              ),
              onSaved: save,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Debe Ingresar un nombre para el proyecto";
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
    String inVal;
    widget._project.details == "-"
        ? inVal = ""
        : inVal = widget._project.details!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        initialValue: inVal,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        minLines: 4,
        maxLines: 5,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          labelText: 'Especificaciones',
        ),
        onSaved: save,
      ),
    );
  }

  Widget _dateProject(FormFieldSetter<String?> save, BuildContext context) {
    var inVal;
    widget._project.date == "-"
        ? inVal = ""
        : inVal = widget._project.date!;
    
    return Padding(
        padding: const EdgeInsets.all(9.0),
        child: TextFormField(
            initialValue: inVal,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today_rounded),
              labelText: "Fecha de entrega",
            ),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickeddate != null) {
                setState(() {
                  widget._project.date = DateFormat("dd-MMM-yyyy").format(pickeddate);
                });
              }
            },
            onSaved: save));
  }

}