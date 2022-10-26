import 'package:flutter/material.dart';
import 'pages/RegistroPage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ThimbleStock",
      debugShowCheckedModeBanner: false,
      home: RegistroWidget(),
    );
  }
}
