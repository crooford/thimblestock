import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';

class ClientRegisterRequest {
  // personal information
  late Image? clientAvatar;
  late String clientName;
  late String clientPhone;
  late String? clientEmail;

// card 1
  late String? clientAge;
  late String? clientHeight;
  late String? clientWeight;
  late String? blouseSize;
  late String? pantSize;
  late String? skirtSize;
  late String? braSize;
  late String? pantySize;
  late String? shoeSize;

////card 2
  late String? contCuel;
  late String? anchHomb;
  late String? anchCuel;
  late String? anchEspa;
  late String? contBust;
  late String? contTora;
  late String? contCint;
  late String? largTalEsp;
  late String? largTalDel;

// card 3
  late String? altuBust;
  late String? sepaBust;
  late String? largTotBra;
  late String? largBraCod;
  late String? contBraz;
  late String? contCade;
  late String? altuCade;
  late String? contMedCade;
  late String? largTiro;

  // card 4
  late String? largTotPie;
  late String? contPier;
  late String? largRodi;
  late String? observ;

  @override
  String toString() {
    return "Nombre: $clientName, Telefono: $clientPhone, Email: $clientEmail\n\nEdad: $clientAge, Estatura: $clientHeight, Peso: $clientWeight\nTalla blusa: $blouseSize, Talla pantalon: $pantSize, Talla falda: $skirtSize\nTalla brassiere: $braSize, Talla panty : $pantySize, Talla calzado: $shoeSize\n\ncontcue: $contCuel, anch homb: $anchHomb, anch cue: $anchCuel\nanch esp $anchEspa, cont bust: $contBust, cont torax$contTora\nCont cint: $contCint, Larg Talle Espa: $largTalEsp, Largo talt del: $largTalDel\n\nAltura Busto: $altuBust, Separ busto: $sepaBust, Largo ttl braz: $largTotBra\nLargo braz codo: $largBraCod, Contorno brazo: $contBraz, Contorno cadera: $contCade\nAltura cadera: $altuCade, Contorno 1/2 cadera: $contMedCade, Largo tiro: $largTiro\n\nLargo ttl Pierna: $largTotPie, Contorno piern: $contPier, Largo rodill: $largRodi\nObservaciones: $observ";
  }
}

class NewClientPage extends StatelessWidget {
  late ClientRegisterRequest _datos;

  NewClientPage({super.key}) {
    _datos = ClientRegisterRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: 'Datos Cliente'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: _formclient(context),
        ),
      ),
    );
  }

  Widget _formclient(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Center(
              child: Stack(
            children: [
              Column(
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
              ),
              SizedBox(
                  width: 120,
                  height: 120,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    alignment: Alignment.bottomRight,
                    color: const Color(0xFF3185FC),
                    onPressed: () {
                      // TODO Tomar foto o agregar desde archivo
                    },
                  ))
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          _clientName(validateRequiredField, (newValue) {
                            _datos.clientName = newValue!;
                          }),
                          _clientPhone(validateRequiredField, (newValue) {
                            _datos.clientPhone = newValue!;
                          }),
                          _clientEmail((newValue) {
                            _datos.clientEmail = newValue!;
                          }),
                        ],
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
                                    const Text("Datos Básicos"),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        _age((newValue) {
                                          _datos.clientAge = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _height((newValue) {
                                          _datos.clientHeight = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _weight((newValue) {
                                          _datos.clientWeight = newValue!;
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text("Tallas generales"),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        _garmentSize('Blusa', (newValue) {
                                          _datos.blouseSize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize('Pantalón', (newValue) {
                                          _datos.pantSize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize('Falda', (newValue) {
                                          _datos.skirtSize = newValue!;
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        _garmentSize('Brassiere', (newValue) {
                                          _datos.braSize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize('Panty', (newValue) {
                                          _datos.pantySize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize('Calzado', (newValue) {
                                          _datos.shoeSize = newValue!;
                                        }),
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
                                    const Text("Medidas específicas 1 de 3"),
                                    const SizedBox(height: 15),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                _basicField('Contorno cuello',
                                                    (newValue) {
                                                  _datos.contCuel = newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField('Ancho hombro',
                                                    (newValue) {
                                                  _datos.anchHomb = newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField('Ancho cuello',
                                                    (newValue) {
                                                  _datos.anchCuel = newValue!;
                                                }),
                                              ],
                                            ))
                                          ],
                                        ))
                                      ],
                                    ),
                                    const SizedBox(height: 10),
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
                                                    (newValue) {
                                                  _datos.anchEspa = newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField('Contorno busto',
                                                    (newValue) {
                                                  _datos.contBust = newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField('Con torno tórax',
                                                    (newValue) {
                                                  _datos.contTora = newValue!;
                                                }),
                                              ],
                                            ))
                                          ],
                                        ))
                                      ],
                                    ),
                                    const SizedBox(height: 12),
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
                                                    (newValue) {
                                                  _datos.contCint = newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField('L. talle-espalda',
                                                    (newValue) {
                                                  _datos.largTalEsp = newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    'L. talle delantero',
                                                    (newValue) {
                                                  _datos.largTalDel = newValue!;
                                                }),
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
                              const Text("Medidas específicas 2 de 3"),
                              const SizedBox(height: 15),
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
                                              (newValue) {
                                            _datos.altuBust = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Separación busto',
                                              (newValue) {
                                            _datos.sepaBust = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Largo total brazo',
                                              (newValue) {
                                            _datos.largTotBra = newValue!;
                                          }),
                                        ],
                                      ))
                                    ],
                                  ))
                                ],
                              ),
                              const SizedBox(height: 10),
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
                                              (newValue) {
                                            _datos.largBraCod = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Contorno brazo',
                                              (newValue) {
                                            _datos.contBraz = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Contorno cadera',
                                              (newValue) {
                                            _datos.contCade = newValue!;
                                          }),
                                        ],
                                      ))
                                    ],
                                  ))
                                ],
                              ),
                              const SizedBox(height: 12),
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
                                              (newValue) {
                                            _datos.altuCade = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Cont 1/2 cadera',
                                              (newValue) {
                                            _datos.contMedCade = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Largo de tiro',
                                              (newValue) {
                                            _datos.largTiro = newValue!;
                                          }),
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
                              const Text("Medidas específicas 3 de 3"),
                              const SizedBox(height: 15),
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
                                              (newValue) {
                                            _datos.largTotPie = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Contorno pierna',
                                              (newValue) {
                                            _datos.contPier = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField('Largo a la rodilla',
                                              (newValue) {
                                            _datos.largRodi = newValue!;
                                          }),
                                        ],
                                      ))
                                    ],
                                  ))
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Observaciones:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  _observ((newValue) {
                                    _datos.observ = newValue!;
                                  }),
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
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    print(_datos);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Información de cliente registrada"),
                      ),
                    );
                    /* // Volver a la pantalla anterior
                    Navigator.pop(context); */
                  }
                },
                child: const Text("Guardar"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return "El campo es obligatorio";
    }
    return null;
  }

  Widget _clientName(
      FormFieldValidator<String?> validate, FormFieldSetter<String?> save) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
                initialValue: '',
                maxLength: 60,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  labelText: 'Nombre',
                ),
                validator: validate,
                onSaved: save)),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _clientPhone(
      FormFieldValidator<String?> validate, FormFieldSetter<String?> save) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
                initialValue: '',
                maxLength: 25,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  labelText: 'Teléfono',
                ),
                validator: validate,
                onSaved: save)),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _clientEmail(FormFieldSetter<String?> save) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
            initialValue: '',
            maxLength: 25,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              labelText: 'E-Mail',
            ),
            onSaved: save));
  }

  Widget _age(FormFieldSetter<String?> save) {
    return Flexible(
        child: TextFormField(
            initialValue: '',
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '00',
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              suffix: Text(' años'),
              border: OutlineInputBorder(),
              labelText: 'Edad',
            ),
            onSaved: save));
  }

  Widget _height(FormFieldSetter<String?> save) {
    return Flexible(
        child: TextFormField(
            initialValue: '',
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '00.0',
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              suffix: Text(' m'),
              border: OutlineInputBorder(),
              labelText: 'Estatura',
            ),
            onSaved: save));
  }

  Widget _weight(FormFieldSetter<String?> save) {
    return Flexible(
        child: TextFormField(
            initialValue: '',
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '00.0',
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              suffix: Text(' Kg'),
              border: OutlineInputBorder(),
              labelText: 'Peso',
            ),
            onSaved: save));
  }

  Widget _garmentSize(String fieldLabel, FormFieldSetter<String?> save) {
    String _fieldLabel = fieldLabel;

    return Flexible(
        child: TextFormField(
            initialValue: '',
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: '',
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              border: const OutlineInputBorder(),
              labelText: _fieldLabel,
            ),
            onSaved: save));
  }

  Widget _basicField(String fieldLabel, FormFieldSetter<String?> save) {
    String _fieldLabel = fieldLabel;

    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_fieldLabel,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.normal,
            )),
        const SizedBox(
          height: 3,
        ),
        Container(
            width: 100,
            decoration: const BoxDecoration(),
            child: TextFormField(
                initialValue: '',
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                  suffix: Text(' cm'),
                  border: OutlineInputBorder(),
                ),
                onSaved: save))
      ],
    ));
  }

  Widget _observ(FormFieldSetter<String?> save) {
    return Flexible(
        child: TextFormField(
            initialValue: '',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            minLines: 4,
            maxLines: 4,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              hintText: "Alergias, gustos, etc.",
              border: OutlineInputBorder(),
            ),
            onSaved: save));
  }
}
