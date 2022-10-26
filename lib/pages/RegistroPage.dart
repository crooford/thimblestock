// ignore: file_names

import 'package:flutter/material.dart';


class RegistroWidget extends StatefulWidget {
  const RegistroWidget({Key? key}) : super(key: key);

  @override
  _RegistroWidgetState createState() => _RegistroWidgetState();
}

class _RegistroWidgetState extends State<RegistroWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;

  late bool passwordVisibility1;
  TextEditingController? textController4;

  late bool passwordVisibility2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    passwordVisibility1 = false;
    textController4 = TextEditingController();
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: const AlignmentDirectional(0,0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, -1),
                  child:Image.asset(
                  'assets/logoverde.png',
                  width: MediaQuery.of(context).size.width * 0.40,
                  fit: BoxFit.cover,
                ),),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
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
                  style:TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25, 40, 25, 0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: TextFormField(
                            controller: textController1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Ingresa tu nombre',
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
                              fillColor:const Color(0xFF808080),
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                            ),
                            style:
                                const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFBFBF2),
                                      fontWeight: FontWeight.w500,
                                    ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: TextFormField(
                            controller: textController2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Ingresa tu email',
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
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                            ),
                            style:
                                const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFBFBF2),
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: TextFormField(
                            controller: textController3,
                            autofocus: true,
                            obscureText: !passwordVisibility1,
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
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(35, 13, 0, 0),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => passwordVisibility1 =
                                      !passwordVisibility1,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  passwordVisibility1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: const Color(0xFFFBFBF2),
                                  size: 20,
                                ),
                              ),
                            ),
                            style:
                                const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFBFBF2),
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        TextFormField(
                          controller: textController4,
                          autofocus: true,
                          obscureText: !passwordVisibility2,
                          decoration: InputDecoration(
                            hintText: 'Confirma tu contraseña',
                            hintStyle:
                                const TextStyle(
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
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(35, 13, 0, 0),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () =>
                                    passwordVisibility2 = !passwordVisibility2,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordVisibility2
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFFFBFBF2),
                                size: 20,
                              ),
                            ),
                          ),
                          style:
                              const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFBFBF2),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Button(
                            onPressed: () {
                              // ignore: avoid_print
                              print('Button pressed ...');
                            },
                            text: 'Registrar',
                            options: ButtonOptions(
                              width: 280,
                              height: 50,
                              color: const Color(0xFF17B890),
                              textStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(50, 6, 50, 0),
                          child:  Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                               Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Ya tienes cuenta ? ',
                                  style:TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                              Text(
                                'Entra aquí',
                                style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF17B890),
                                    ),
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
  
  // ignore: non_constant_identifier_names
  Button({required Null Function() onPressed, required String text, required options}) {}
  
  // ignore: non_constant_identifier_names
  ButtonOptions({required int width, required int height, required Color color, required textStyle, required BorderSide borderSide, required BorderRadius borderRadius}) {}
}
