import 'package:flutter/material.dart';
import '../../controller/login.dart';
import '../../controller/request/login.dart';

import 'RegistroPage.dart';
import 'dashboard.dart';

class LoginWidget extends StatelessWidget {
  final _imageUrl = "assets/maniqui.png";
  late LoginController _controller;
  late LoginRequest request;

  LoginWidget({super.key}) {
    _controller = LoginController();
    request = LoginRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: Image.asset(
                  'assets/logoverde.png',
                  width: 150,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _logo(),
                        _formulario(context),
                        _inicioAlternativo(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Aún no tienes cuenta?"),
                            TextButton(
                              child: const Text(
                                "Regístrate aqui",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF17B890),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistroWidget()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Column(
      children: [
        const SizedBox(
          height: 1,
        ),
        Image.asset(_imageUrl),
        const SizedBox(
          height: 20,
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
          const SizedBox(height: 10),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFBFBF2)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF17B890)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ))),
              child: const Text(
                "Entrar",
                style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  // TODO: Validar usuario y contraseña en BD
                  try {
                    _controller.validateEmailPassord(request);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardPage(),
                      ),
                    );
                  } catch (ex) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(ex.toString())));
                  }
                }
              },
            ),
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
        border: const OutlineInputBorder(),
        labelText: 'Correo Electrónico',
        labelStyle: const TextStyle(color: Colors.black),
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
        fillColor: const Color.fromARGB(111, 128, 128, 128),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
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
      onSaved: (value) {
        request.email = value!;
      },
    );
  }

  Widget _campoClave() {
    return TextFormField(
      maxLength: 30,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        labelStyle: const TextStyle(color: Colors.black),
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
        fillColor: const Color.fromARGB(111, 128, 128, 128),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
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
      onSaved: (value) {
        request.password = value!;
      },
    );
  }

  Widget _inicioAlternativo() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("O iniciar sesion con"),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFBFBF2)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 255, 0, 0)),
              ),
              child: const Text("Facebook"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text("Google"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
