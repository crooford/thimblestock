import 'package:flutter/material.dart';
import 'updateclient.dart';

import '../../model/entity/clients.dart';
import '../widgets/customAppBar.dart';


class OneClientPage extends StatelessWidget {
  ClientEntity client;

  OneClientPage({super.key, required this.client});

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
                builder: (context) => UpdateClientPage(client),  // añadir logica para enviar datos a formulario
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
                          _clientName(client.clientName!),
                          const SizedBox(
                            height: 20,
                          ),
                          _clientPhone(client.clientPhone!),
                          const SizedBox(
                            height: 20,
                          ),
                          _clientEmail(client.clientEmail!),
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
                                      _basicData(
                                          "Edad", client.clientAge!, "años"),
                                      const SizedBox(width: 10),
                                      _basicData("Estatura",
                                          client.clientHeight!, "m"),
                                      const SizedBox(width: 10),
                                      _basicData(
                                          "Peso", client.clientWeight!, "Kg"),
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
                                      _garmentSize('Blusa', client.blouseSize!),
                                      const SizedBox(width: 10),
                                      _garmentSize(
                                          'Pantalón', client.pantSize!),
                                      const SizedBox(width: 10),
                                      _garmentSize('Falda', client.skirtSize!),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      _garmentSize(
                                          'Brassiere', client.braSize!),
                                      const SizedBox(width: 10),
                                      _garmentSize('Panty', client.pantySize!),
                                      const SizedBox(width: 10),
                                      _garmentSize('Calzado', client.shoeSize!),
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
                                              _basicField('Contorno cuello',
                                                  client.contCuel!),
                                              const SizedBox(width: 10),
                                              _basicField('Ancho hombro',
                                                  client.anchHomb!),
                                              const SizedBox(width: 10),
                                              _basicField('Ancho cuello',
                                                  client.anchCuel!),
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
                                              _basicField('Ancho de espalda',
                                                  client.anchEspa!),
                                              const SizedBox(width: 10),
                                              _basicField('Contorno busto',
                                                  client.contBust!),
                                              const SizedBox(width: 10),
                                              _basicField('Con torno tórax',
                                                  client.contTora!),
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
                                              _basicField('Contorno cintura',
                                                  client.contCint!),
                                              const SizedBox(width: 10),
                                              _basicField('L. talle-espalda',
                                                  client.largTalEsp!),
                                              const SizedBox(width: 10),
                                              _basicField('L. talle delantero',
                                                  client.largTalDel!),
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
                                        _basicField('Altura de busto',
                                            client.altuBust!),
                                        const SizedBox(width: 10),
                                        _basicField('Separación busto',
                                            client.sepaBust!),
                                        const SizedBox(width: 10),
                                        _basicField('Largo total brazo',
                                            client.largTotBra!),
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
                                        _basicField('L. brazo al codo',
                                            client.largBraCod!),
                                        const SizedBox(width: 10),
                                        _basicField(
                                            'Contorno brazo', client.contBraz!),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno cadera',
                                            client.contCade!),
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
                                        _basicField('Altura de cadera',
                                            client.altuCade!),
                                        const SizedBox(width: 10),
                                        _basicField('Cont 1/2 cadera',
                                            client.contMedCade!),
                                        const SizedBox(width: 10),
                                        _basicField(
                                            'Largo de tiro', client.largTiro!),
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
                                        _basicField('Largo total pierna',
                                            client.largTotPie!),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno pierna',
                                            client.contPier!),
                                        const SizedBox(width: 10),
                                        _basicField('Largo a la rodilla',
                                            client.largRodi!),
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
                                _observ(client.observ!),
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

    if (_fieldValue == "-") _sufix = "";

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
              "$_fieldValue $_sufix",
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
              _fieldValue,
              textAlign: TextAlign.center,
            ))
      ],
    ));
  }

  Widget _basicField(String fieldLabel, String fieldValue) {
    String _fieldLabel = fieldLabel;
    String _fieldValue = fieldValue;
    String _sufix = "cm";

    if (_fieldValue == "-") _sufix = "";

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
              "$_fieldValue $_sufix",
              textAlign: TextAlign.center,
            ))
      ],
    ));
  }

  Widget _observ(String observ) {
    String _observ = observ;

    if (_observ == "-") _observ = "";

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
