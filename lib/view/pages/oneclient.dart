import 'package:flutter/material.dart';
import 'updateclient.dart';

import '../../model/entity/clients.dart';
import '../widgets/customAppBar.dart';

class OneClientPage extends StatefulWidget {
  ClientEntity client;

  OneClientPage({super.key, required this.client});

  @override
  State<OneClientPage> createState() => _OneClientPageState();
}

class _OneClientPageState extends State<OneClientPage> {
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
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateClientPage(widget
                    .client), // añadir logica para enviar datos a formulario
              ),
            );
            setState(() {
              widget.client.clientAvatar;
            });
          },
        ));
  }

  Widget _client(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Column(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF17B890),
              radius: 55,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: widget.client.clientAvatar != null
                    ? NetworkImage(widget.client.clientAvatar!)
                    : const NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/thimblestock1.appspot.com/o/clientDefault.jpg?alt=media&token=938d2907-f7d7-48f5-ae90-0f0d7eae8044"),
                // FileImage(File(client.clientAvatar!))
                // backgroundImage: FileImage(File('/data/user/0/com.example.thimblestock/cache/CAP6212320448003122403.jpg')),
                // backgroundImage: AssetImage('assets/clientDefault.jpg'),
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
                          _clientName(widget.client.clientName!),
                          const SizedBox(
                            height: 20,
                          ),
                          _clientPhone(widget.client.clientPhone!),
                          const SizedBox(
                            height: 20,
                          ),
                          _clientEmail(widget.client.clientEmail!),
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
                                      _basicData("Edad",
                                          widget.client.clientAge!, "años"),
                                      const SizedBox(width: 10),
                                      _basicData("Estatura",
                                          widget.client.clientHeight!, "m"),
                                      const SizedBox(width: 10),
                                      _basicData("Peso",
                                          widget.client.clientWeight!, "Kg"),
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
                                      _garmentSize(
                                          'Blusa', widget.client.blouseSize!),
                                      const SizedBox(width: 10),
                                      _garmentSize(
                                          'Pantalón', widget.client.pantSize!),
                                      const SizedBox(width: 10),
                                      _garmentSize(
                                          'Falda', widget.client.skirtSize!),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      _garmentSize(
                                          'Brassiere', widget.client.braSize!),
                                      const SizedBox(width: 10),
                                      _garmentSize(
                                          'Panty', widget.client.pantySize!),
                                      const SizedBox(width: 10),
                                      _garmentSize(
                                          'Calzado', widget.client.shoeSize!),
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
                                                  widget.client.contCuel!),
                                              const SizedBox(width: 10),
                                              _basicField('Ancho hombro',
                                                  widget.client.anchHomb!),
                                              const SizedBox(width: 10),
                                              _basicField('Ancho cuello',
                                                  widget.client.anchCuel!),
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
                                                  widget.client.anchEspa!),
                                              const SizedBox(width: 10),
                                              _basicField('Contorno busto',
                                                  widget.client.contBust!),
                                              const SizedBox(width: 10),
                                              _basicField('Con torno tórax',
                                                  widget.client.contTora!),
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
                                                  widget.client.contCint!),
                                              const SizedBox(width: 10),
                                              _basicField('L. talle-espalda',
                                                  widget.client.largTalEsp!),
                                              const SizedBox(width: 10),
                                              _basicField('L. talle delantero',
                                                  widget.client.largTalDel!),
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
                                            widget.client.altuBust!),
                                        const SizedBox(width: 10),
                                        _basicField('Separación busto',
                                            widget.client.sepaBust!),
                                        const SizedBox(width: 10),
                                        _basicField('Largo total brazo',
                                            widget.client.largTotBra!),
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
                                            widget.client.largBraCod!),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno brazo',
                                            widget.client.contBraz!),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno cadera',
                                            widget.client.contCade!),
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
                                            widget.client.altuCade!),
                                        const SizedBox(width: 10),
                                        _basicField('Cont 1/2 cadera',
                                            widget.client.contMedCade!),
                                        const SizedBox(width: 10),
                                        _basicField('Largo de tiro',
                                            widget.client.largTiro!),
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
                                            widget.client.largTotPie!),
                                        const SizedBox(width: 10),
                                        _basicField('Contorno pierna',
                                            widget.client.contPier!),
                                        const SizedBox(width: 10),
                                        _basicField('Largo a la rodilla',
                                            widget.client.largRodi!),
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
                                _observ(widget.client.observ!),
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
