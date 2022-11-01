import 'package:flutter/material.dart';

import 'RegistroPage.dart';
import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  final _imageUrl = "assets/maniqui.png";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: const AlignmentDirectional(-1, -1),
              child: Image.asset(
                'assets/logoverde.png',
                width: MediaQuery.of(context).size.width * 0.40,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  _logo(),
                  _formulario(context),
                  _inicioAlternativo(),
                  Row(
                    children: [
                      const Text("Aún no tienes cuenta, "),
                      TextButton(
                        child: const Text(
                          " Registrate aqui",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF17B890),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistroWidget()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(_imageUrl),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _formulario(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          _campoCorreoElectronico(),
          const SizedBox(height: 8),
          _campoClave(),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFBFBF2)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF17B890)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(color: Colors.red)))),
            child: const Text(
              "Entrar",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // TODO: Validar usuario y contraseña en BD

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _campoCorreoElectronico() {
    return TextFormField(
      maxLength: 50,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Ingresa tu email',
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFFBFBF2),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Correo Electrónico',
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        filled: true,
        fillColor: const Color(0xFF808080),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "El correo electronico es obligatorio";
        }
        if (!value.contains("@") || !value.contains(".")) {
          return "El correo tiene un formato inválido";
        }
        return null;
      },
    );
  }

  Widget _campoClave() {
    return TextFormField(
      maxLength: 30,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Ingresa tu contraseña',
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xFFFBFBF2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        filled: true,
        fillColor: const Color(0xFF808080),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(35, 13, 0, 0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "La contraseña es obligatoria";
        }
        if (value.length < 6) {
          return "Minimo debe contener 6 caracteres";
        }
        return null;
      },
    );
  }

  Widget _inicioAlternativo() {
    return Column(
      children: [
        const Text("O iniciar sesion con"),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text("Facebook"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text("Google"),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
