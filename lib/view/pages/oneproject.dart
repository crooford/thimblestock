import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../model/entity/projects.dart';
import '../pages/newproject.dart';
import '../widgets/customAppBar.dart';

class OneProjectPage extends StatelessWidget {
  ProjectEntity project;
  OneProjectPage ({super.key , required this.project});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: CusAppBar(pageTitle: 'Datos del Proyecto'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: _project(context),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  NewProject(),
            ),
          );
        },
      ),  
    );
  }
  Widget _project(BuildContext context) {
    return Column(
            children: [
              Card(
                elevation: 5,
                color: const Color(0xFFFBFBF2),
                child: SizedBox(
                        width: 350,
                        height: 200,
                        child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          _projectName(project.projectName!),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          _description(project.details!),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          _dateProject(project.date!),
                                        ],
                                      ),
                              )
                      )
              ),
            ],
          );
  }

  Widget _projectName(String nameProject) {
    String _nameProject = nameProject;
    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Nombre del Proyecto:",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              _nameProject,
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }

  Widget _description(String description) {
    String _description = description;
    return  Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Descripcion del Proyecto:",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              _description,
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }

  Widget _dateProject(String date ) {
    String _dateProject = date;
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text("Fecha de entrega"),
          TableCalendar(
            firstDay: DateTime(2000),
            lastDay: DateTime(2101),
            focusedDay: DateTime.parse(_dateProject),
            
          ),
          
        ],
    
      ),
    );
  }
}


