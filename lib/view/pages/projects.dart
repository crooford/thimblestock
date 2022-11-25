import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/view/pages/newproject.dart';
import 'package:thimblestock/view/pages/oneproject.dart';

import '../../controller/activity.dart';
import '../../controller/projects.dart';
import '../../model/entity/activity.dart';
import '../../model/entity/projects.dart';
import '../widgets/customAppBar.dart';
import 'updateproject.dart';

class ProjectsPage extends StatefulWidget {
  final _pref = SharedPreferences.getInstance();
  late final ProjectEntity _project;
  late final ActivityEntity _activity;
  late final ActivityController _activitycontroller;
  final String action = "deleteProject";

  ProjectsPage({super.key}) {
    _project = ProjectEntity();
    _activitycontroller = ActivityController();
    _activity = ActivityEntity();
    _pref.then((pref) {
      _project.user = pref.getString("uid");
      _activity.user = pref.getString("uid");
    });
  }
  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<ProjectEntity> _list = [];
  final _pref = SharedPreferences.getInstance();
  final _projectController = ProjectController();
  final _activitycontroller = ActivityController();
  final _activity = ActivityEntity();

 @override
  void initState() {
    super.initState();

    _pref.then((pref) {
      _activity.user = pref.getString("uid");
      _listProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(
        pageTitle: "Proyectos",
      ), // Reemplazar por appBar widget
      // Aqui va el cuerpo de la app
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Text(
                  "Listado de Projectos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) => ListTile(
                  
                  title: Text(_list[index].projectName!),
                  subtitle: Text(_list[index].clientName! +'   '+_list[index].date!),
                  trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        
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
                                Text("Editar proyecto"),
                              ],
                            ),
                            onTap: () async {
                              Navigator.pop(context);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateProjectPage(_list[
                                      index]), // añadir logica para enviar datos a formulario
                                ),
                              );
                              if (!mounted) return;
                              _listProjects();
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
                                Text("Borrar proyecto"),
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
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OneProjectPage(project: _list[index]),
                      ),
                    );
                    setState(() {
                      _listProjects();
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewProject(),
            ),
          );
          if (!mounted) return;
          _listProjects();
        },
      ),
    );
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
        Navigator.pop(context);
        try {
          final mess = ScaffoldMessenger.of(context);
          await _projectController.deleteproject(_list[index].projectId);
          mess.showSnackBar(
            const SnackBar(
              content: Text("El proyecto ha sido borrado"),
            ),
          );
          // Almacenar el documento de la eliminacion de un cliente en la BD de Activities
          _activity.typeOfActivity = widget.action;
          _activity.detailOfActivity = _list[index].projectName;
          await _activitycontroller.saveActivity(_activity);

          setState(() {
            _listProjects();
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
          "Va a borrar el proyecto ${_list[index].projectName}. Esta acción es irreversible"),
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

  void _listProjects() {
    _pref.then((pref) {
      var id = pref.getString("uid") ?? "";
      _projectController.listAll(id).then((value) {
        setState(() {
          _list = value;
        });
      });
    });
  }
}
