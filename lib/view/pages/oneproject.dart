import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../pages/newproject.dart';
import '../widgets/customAppBar.dart';
class OneProjectPage extends StatefulWidget {
  const OneProjectPage
({super.key});

  @override
  State<OneProjectPage> createState () => _OneProjectPageState();
}

class _OneProjectPageState extends State<OneProjectPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CusAppBar(pageTitle: 'Datos Proyecto'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Column(children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Nombre del cliente",
                        style: TextStyle(
                          
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                
               
                ],),

              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: Text("Especificaciones del Proyecto",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 40),
                  child: Text("Informacion detallada del proyecto, tal como: color de la tela, tipo de prenda, modificaciones adicionales. Informacion detallada del proyecto, tal como: color de la tela, tipo de prenda, modificaciones adicionales. Informacion detallada del proyecto, tal como: color de la tela, tipo de prenda, modificaciones adicionales.",
                  style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            
                          ),)
                ),
            
            ],),

            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(children:[
                TableCalendar(
                  firstDay: DateTime.utc(2010,01,01),
                  lastDay: DateTime.utc(2040,12,31),
                  focusedDay: DateTime.now(),
                ),
              ],),
            ),   
          ],),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
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
}
