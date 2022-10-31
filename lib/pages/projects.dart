import 'package:flutter/material.dart';
import 'package:thimblestock/pages/oneproject.dart';




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
            const Text(
              "Listado de Proyectos",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),Row(
              children: const[Text("Barra de Busqueda"),],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const CircleAvatar(),
                  title: Text(lista[index]),
                  subtitle: const Text("318 000 000"),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
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
        child: const Icon(Icons.add_card),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OneProjectPage(),
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
