import 'package:flutter/material.dart';

import '../../model/entity/clients.dart';
import '../widgets/customAppBar.dart';
import 'newclient.dart';

class OneClientPage extends StatelessWidget {
  late ClientEntity _datos;
 final String email;

  OneClientPage( {super.key, required this.email}) {   
    _datos = ClientEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CusAppBar(pageTitle: 'Datos de Cliente'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: _client(context),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewClientPage(email),
              ),
            );
          },
        ));
  }

  Widget _client(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Column(
          children: const [
            CircleAvatar(
              backgroundColor: Color(0xFF17B890),
              radius: 55,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/cliente01.jpg'),
              ),
            )
          ],
        )),
        Column(
          children: [
            Card(
                elevation: 5,
                color: const Color(0xFFFBFBF2),
                child: SizedBox(
                    width: 350,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          _clientName("varClientName"),
                          const SizedBox(
                            height: 20,
                          ),
                          _clientPhone("varClientPhone"),
                          const SizedBox(
                            height: 20,
                          ),
                          _clientEmail("varClientEmail"),
                        ],
                      ),
                    ))),
            const SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                      elevation: 5,
                      color: const Color(0xFFFBFBF2),
                      child: SizedBox(
                          width: 330,
                          height: 240,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  const Text("Datos Básicos",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF17B890),
                                      )),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      _basicData("Edad", "varAge", "años"),
                                      const SizedBox(width: 10),
                                      _basicData("Estatura", "varHeight", "m"),
                                      const SizedBox(width: 10),
                                      _basicData("Peso", "varWeight", "Kg"),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text("Tallas generales",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF17B890),
                                      )),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      _garmentSize('Blusa', "varSize01"),
                                      const SizedBox(width: 10),
                                      _garmentSize('Pantalón', "varSize02"),
                                      const SizedBox(width: 10),
                                      _garmentSize('Falda', "varSize03"),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      _garmentSize('Brassiere', "varSize04"),
                                      const SizedBox(width: 10),
                                      _garmentSize('Panty', "varSize05"),
                                      const SizedBox(width: 10),
                                      _garmentSize('Calzado', "varSize06"),
                                    ],
                                  ),
                                ],
                              )))),
                  Card(
                      elevation: 5,
                      color: const Color(0xFFFBFBF2),
                      child: SizedBox(
                          width: 330,
                          height: 240,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  const Text("Medidas específicas 1 de 3",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF17B890),
                                      )),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Flexible(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                              child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              _basicField(
                                                  'Contorno cuello', "var1"),
                                              const SizedBox(width: 10),
                                              _basicField(
                                                  'Ancho hombro', "var2"),
                                              const SizedBox(width: 10),
                                              _basicField(
                                                  'Ancho cuello', "var3"),
                                            ],
                                          ))
                                        ],
                                      ))
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Flexible(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                              child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _basicField(
                                                  'Ancho de espalda', "var4"),
                                              const SizedBox(width: 10),
                                              _basicField(
                                                  'Contorno busto', "var5"),
                                              const SizedBox(width: 10),
                                              _basicField(
                                                  'Con torno tórax', "var6"),
                                            ],
                                          ))
                                        ],
                                      ))
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Flexible(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                              child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _basicField(
                                                  'Contorno cintura', "var7"),
                                              const SizedBox(width: 10),
                                              _basicField(
                                                  'L. talle-espalda', "var8"),
                                              const SizedBox(width: 10),
                                              _basicField(
                                                  'L. talle delantero', "var9"),
                                            ],
                                          ))
                                        ],
                                      ))
                                    ],
                                  )
                                ],
                              )))),
                  Card(
                    elevation: 5,
                    color: const Color(0xFFFBFBF2),
                    child: SizedBox(
                      width: 330,
                      height: 240,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const Text("Medidas específicas 2 de 3",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF17B890),
                                )),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Flexible(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                        child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _basicField('Altura de busto', "var10"),
                                        const SizedBox(width: 10),
                                        _basicField(
                                            'Separación busto', "var11"),
                                        const SizedBox(width: 10),
                                        _basicField(
                                            'Largo total brazo', "var12"),
                                      ],
                                    ))
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Flexible(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                        child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _basicField(
                                            'L. brazo al codo', "var13"),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno brazo', "var14"),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno cadera', "var15"),
                                      ],
                                    ))
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Flexible(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                        child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _basicField(
                                            'Altura de cadera', "var16"),
                                        const SizedBox(width: 10),
                                        _basicField('Cont 1/2 cadera', "var17"),
                                        const SizedBox(width: 10),
                                        _basicField('Largo de tiro', "var18"),
                                      ],
                                    ))
                                  ],
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: const Color(0xFFFBFBF2),
                    child: SizedBox(
                      width: 330,
                      height: 240,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const Text("Medidas específicas 3 de 3",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF17B890),
                                )),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Flexible(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                        child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _basicField(
                                            'Largo total pierna', "var19"),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno pierna', "var20"),
                                        const SizedBox(width: 10),
                                        _basicField(
                                            'Largo a la rodilla', "var21"),
                                      ],
                                    ))
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Observaciones:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF17B890),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                _observ(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi uter"),
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
            const SizedBox(height: 8),
          ],
        ),
      ],
    );
  }

  String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo es obligatorio";
    }
    return null;
  }

  Widget _clientName(String name) {
    String _name = name;

    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Nombre:",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              _name,
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }

  Widget _clientPhone(String phone) {
    String _phone = phone;

    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Teléfono:",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              _phone,
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }

  Widget _clientEmail(String email) {
    String _email = email;

    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Email:",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              _email,
              textAlign: TextAlign.start,
            ))
      ],
    ));
  }

  Widget _basicData(String fieldLabel, String fieldValue, String sufix) {
    String _fieldLabel = fieldLabel;
    String _fieldValue = fieldValue;
    String _sufix = sufix;

    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_fieldLabel,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              "$_fieldValue $sufix",
              textAlign: TextAlign.center,
            ))
      ],
    ));
  }

  Widget _garmentSize(String fieldLabel, String fieldValue) {
    String _fieldLabel = fieldLabel;
    String _fieldValue = fieldValue;

    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_fieldLabel,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              "$_fieldValue",
              textAlign: TextAlign.center,
            ))
      ],
    ));
  }

  Widget _basicField(String fieldLabel, String fieldValue) {
    String _fieldLabel = fieldLabel;
    String _fieldValue = fieldValue;

    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_fieldLabel,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF17B890),
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: Text(
              "$_fieldValue cm",
              textAlign: TextAlign.center,
            ))
      ],
    ));
  }

  Widget _observ(String observ) {
    return Flexible(
        child: SizedBox(
            width: 330,
            child: Text(
              observ,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            )));
  }
}
