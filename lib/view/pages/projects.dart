import 'package:flutter/material.dart';
import 'package:thimblestock/view/pages/newproject.dart';
import 'package:thimblestock/view/pages/oneproject.dart';




class ProjectsPage extends StatelessWidget {
  const ProjectsPage ({super.key});
  
  @override
  Widget build(BuildContext context) {
    final lista = _listProjects();
    return Scaffold(
      appBar:
          AppBar(
          
        automaticallyImplyLeading: false,
        title: const Text(
          'Proyectos',
          style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'assets/appbarlogo.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ), // Reemplazar por appBar widget
      // Aqui va el cuerpo de la app
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Row(
                children: [
                  const Text("Barra de Busqueda"),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: IconButton(
                      icon:const Icon(Icons.search),
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const CircleAvatar(),
                  title: Text(lista[index]),
                  subtitle: const Text("Nombre proyecto - fecha de entrega"),
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
                        builder: (context) => const OneProjectPage(),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewProject(),
            ),
          );
        },
      ),
    );
  }

  List<String> _listProjects() {
    //TODO:  Base de Datos

    return List<String>.generate(
      5,
      (index) => "Cliente ${index + 1}",
    );
  }
}
