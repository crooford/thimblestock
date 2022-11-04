import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class OneProjectPage extends StatefulWidget {
  const OneProjectPage
({super.key});

  @override
  State<OneProjectPage> get createState => _OneProjectPageState();
}

class _OneProjectPageState extends State<OneProjectPage> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010,01,01),
              lastDay: DateTime.utc(2040,12,31),
              focusedDay: DateTime.now(),
            )
          ],
        ),
      ),
    );
  }
}
