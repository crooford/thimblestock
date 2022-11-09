// ignore: file_names

import 'package:flutter/material.dart';
//import '/view/pages/inicio.dart';

import '../../controller/login.dart';
import '../../controller/register.dart';
import 'loginPage.dart';

class RegistroWidget extends StatelessWidget {
  late RegisterRequest _data;
  late LoginController _controller;
  late String passConfirmation;

  RegistroWidget({super.key}) {
    _data = RegisterRequest();
    _controller = LoginController();
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, -1),
                  child: Image.asset(
                    'assets/logoverde.png',
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Bienvenido a Bordo',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF0B0A07),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text(
                          'Empieza a tomar medidas',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25, 20, 25, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    _name(),
                                    const SizedBox(height: 8),
                                    _email(),
                                    const SizedBox(height: 8),
                                    _phone(),
                                    const SizedBox(height: 8),
                                    _password(),
                                    const SizedBox(height: 8),
                                    _passwordConfirmation(),
                                    SizedBox(
                                      width: 280,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 10, 20, 0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xFFFBFBF2)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xFF17B890)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ))),
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              formKey.currentState!.save();
                                              try {
                                                await _controller
                                                    .registerNewUser(_data);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          "Usuario registrado correctamente")),
                                                );
                                                Navigator.pop(context);
                                              } catch (error) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content:
                                                        Text(error.toString()),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          child: const Text(
                                            "Registrar",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Ya tienes cuenta ? ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      "Ingresa aquí",
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
                                                LoginWidget()),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return TextFormField(
      maxLength: 60,
      keyboardType: TextInputType.name,
      decoration: _inputDecor('Ingresa tu nombre'),
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF0B0A07),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "El nombre es obligatorio";
        }
      },
      onSaved: (value) {
        _data.name = value!;
      },
    );
  }

  Widget _email() {
    return TextFormField(
      maxLength: 50,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecor('Ingresa tu email'),
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF0B0A07),
      ),
      textAlign: TextAlign.start,
      validator: (value) => validateEmail(value),
      onSaved: (value) {
        _data.email = value!;
      },
    );
  }

  Widget _phone() {
    return TextFormField(
      maxLength: 20,
      keyboardType: TextInputType.name,
      decoration: _inputDecor('Ingresa tu telefono'),
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF0B0A07),
      ),
      onSaved: (value) {
        _data.phone = value;
      },
    );
  }

  Widget _password() {
    return TextFormField(
      maxLength: 16,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: _inputDecor('Ingresa tu contraseña'),
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF0B0A07),
      ),
      textAlign: TextAlign.start,
      validator: (value) {
        passConfirmation = value!;
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

  Widget _passwordConfirmation() {
    return TextFormField(
      maxLength: 16,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: _inputDecor('Confirma tu contraseña'),
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF0B0A07),
      ),
      textAlign: TextAlign.start,
      validator: (value) {
        if (value!.isEmpty) {
          return "Vuelve a ingresar tu contraseña";
        } else if (value.length < 6) {
          return "La contraseña debe tener al menos 6 caracteres";
        } else if (value != passConfirmation) {
          return "La contraseña debe coincidir con la anterior";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _data.password = value!;
      },
    );
  }

  InputDecoration _inputDecor(String label) {
    String _label = label;
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: _label,
      labelStyle: const TextStyle(color: Color(0xFF0B0A07)),
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
    );
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "El correo electronico es obligatorio";
    }
    if (!value.contains("@") ||
        !value.contains(".") ||
        !regex.hasMatch(value)) {
      return 'Introduce una dirección de email válida';
    } else
      return null;
  }
}
