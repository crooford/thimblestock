import 'package:flutter/material.dart';
import '/pages/dashboard.dart';

//import '../widgets/barraNavAbajo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Está seguro?'),
      content: const Text('Desea cerrar Thimblestock?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Si'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final lista = _listClients();
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Inicio',
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Center(
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color(0xFF17B890),
                      radius: 85,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/user_avatar.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bienvenido ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "nomb_usuario", //esto se debe reemplazar por el nombre del usuario
                      style: TextStyle(
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
                          builder: (context) =>
                              const DashboardPage(), // por ahora redirige a dashboard page
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
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
