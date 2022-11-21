import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/view/pages/newproject.dart';
import 'package:thimblestock/view/pages/oneproject.dart';

import '../../controller/projects.dart';
import '../../model/entity/projects.dart';
import '../widgets/customAppBar.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});
  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<ProjectEntity> _list = [];
  final _pref = SharedPreferences.getInstance();
  final _projectController = ProjectController();

  @override
  void initState() {
    super.initState();
    _listProjects();
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                  leading: const CircleAvatar(),
                  title: Text(_list[index].projectName!),
                  subtitle: Text(_list[index].projectName!),
                  trailing: IconButton(
                    icon: const Icon(Icons.view_headline),
                    onPressed: () {
                      // TODO Realizar la llamada Telefonica
                    },
                  ),
                  onTap: () {
                    // TODO: Debe redirigir a los datos del cliente especifico

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OneProjectPage(project: _list[index]),
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
