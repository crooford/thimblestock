import 'package:flutter/material.dart';
import '../widgets/customAppBar.dart';
import '../pages/dashboard.dart';

//import '../widgets/barraNavAbajo.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String name;
  const HomePage({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    final lista = _listClients();
    return Scaffold(
      appBar: CusAppBar(pageTitle: "Inicio"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFF17B890),
                    radius: 85,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/user_avatar.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Bienvenido ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    name, //esto se debe reemplazar por el nombre del usuario
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Actividad reciente",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(lista[index]),
                  subtitle: Text("fecha / hora de actividad"),
                  onTap: () {
                    // TODO: Debe redirigir la activdad especifica
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardPage(
                            email: email,
                            name: name), // por ahora redirige a homepage
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> _listClients() {
    //TODO:  Base de Datos

    return List<String>.generate(
      5,
      (index) => "Evento ${index + 1}",
    );
  }
}
