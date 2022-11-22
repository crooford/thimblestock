import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/clients.dart';
import '../../model/entity/clients.dart';
import '../widgets/customAppBar.dart';
import '../widgets/photo_avatar.dart';
import 'clients.dart';

class UpdateClientPage extends StatefulWidget {
  final _pref = SharedPreferences.getInstance();
  late final ClientEntity _client;
  late final ClientController _controller;

  UpdateClientPage(ClientEntity client, {super.key}) {
    _client = client;
    _controller = ClientController();
    _pref.then((pref) {
      _client.user = pref.getString("uid");
    });
  }

  @override
  State<UpdateClientPage> createState() => _UpdateClientPageState();
}

class _UpdateClientPageState extends State<UpdateClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: 'Actualizar Información'),
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
          PhotoAvatarWidget(client: widget._client),
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
                            widget._client.clientName = newValue!;
                          }),
                          _clientPhone(validateRequiredField, (newValue) {
                            widget._client.clientPhone = newValue!;
                          }),
                          _clientEmail(validateRequiredField, (newValue) {
                            widget._client.clientEmail = newValue!;
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
                                          widget._client.clientAge = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _height((newValue) {
                                          widget._client.clientHeight =
                                              newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _weight((newValue) {
                                          widget._client.clientWeight =
                                              newValue!;
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text("Tallas generales"),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        _garmentSize(
                                            widget._client.blouseSize!, 'Blusa',
                                            (newValue) {
                                          widget._client.blouseSize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize(widget._client.pantSize!,
                                            'Pantalón', (newValue) {
                                          widget._client.pantSize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize(
                                            widget._client.skirtSize!, 'Falda',
                                            (newValue) {
                                          widget._client.skirtSize = newValue!;
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        _garmentSize(widget._client.braSize!,
                                            'Brassiere', (newValue) {
                                          widget._client.braSize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize(
                                            widget._client.pantySize!, 'Panty',
                                            (newValue) {
                                          widget._client.pantySize = newValue!;
                                        }),
                                        const SizedBox(width: 10),
                                        _garmentSize(
                                            widget._client.shoeSize!, 'Calzado',
                                            (newValue) {
                                          widget._client.shoeSize = newValue!;
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
                                                _basicField(
                                                    widget._client.contCuel,
                                                    'Contorno cuello',
                                                    (newValue) {
                                                  widget._client.contCuel =
                                                      newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    widget._client.anchHomb,
                                                    'Ancho hombro', (newValue) {
                                                  widget._client.anchHomb =
                                                      newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    widget._client.anchCuel,
                                                    'Ancho cuello', (newValue) {
                                                  widget._client.anchCuel =
                                                      newValue!;
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
                                                _basicField(
                                                    widget._client.anchEspa,
                                                    'Ancho de espalda',
                                                    (newValue) {
                                                  widget._client.anchEspa =
                                                      newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    widget._client.contBust,
                                                    'Contorno busto',
                                                    (newValue) {
                                                  widget._client.contBust =
                                                      newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    widget._client.contTora,
                                                    'Con torno tórax',
                                                    (newValue) {
                                                  widget._client.contTora =
                                                      newValue!;
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
                                                _basicField(
                                                    widget._client.contCint,
                                                    'Contorno cintura',
                                                    (newValue) {
                                                  widget._client.contCint =
                                                      newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    widget._client.largTalEsp,
                                                    'L. talle-espalda',
                                                    (newValue) {
                                                  widget._client.largTalEsp =
                                                      newValue!;
                                                }),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    widget._client.largTalDel,
                                                    'L. talle delantero',
                                                    (newValue) {
                                                  widget._client.largTalDel =
                                                      newValue!;
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
                                          _basicField(widget._client.altuBust,
                                              'Altura de busto', (newValue) {
                                            widget._client.altuBust = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(widget._client.sepaBust,
                                              'Separación busto', (newValue) {
                                            widget._client.sepaBust = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(widget._client.largTotBra,
                                              'Largo total brazo', (newValue) {
                                            widget._client.largTotBra =
                                                newValue!;
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
                                          _basicField(widget._client.largBraCod,
                                              'L. brazo al codo', (newValue) {
                                            widget._client.largBraCod =
                                                newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(widget._client.contBraz,
                                              'Contorno brazo', (newValue) {
                                            widget._client.contBraz = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(widget._client.contCade,
                                              'Contorno cadera', (newValue) {
                                            widget._client.contCade = newValue!;
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
                                          _basicField(widget._client.altuCade,
                                              'Altura de cadera', (newValue) {
                                            widget._client.altuCade = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(
                                              widget._client.contMedCade,
                                              'Cont 1/2 cadera', (newValue) {
                                            widget._client.contMedCade =
                                                newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(widget._client.largTiro,
                                              'Largo de tiro', (newValue) {
                                            widget._client.largTiro = newValue!;
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
                                          _basicField(widget._client.largTotPie,
                                              'Largo total pierna', (newValue) {
                                            widget._client.largTotPie =
                                                newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(widget._client.contPier,
                                              'Contorno pierna', (newValue) {
                                            widget._client.contPier = newValue!;
                                          }),
                                          const SizedBox(width: 10),
                                          _basicField(widget._client.largRodi,
                                              'Largo a la rodilla', (newValue) {
                                            widget._client.largRodi = newValue!;
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
                                  _observ(widget._client.observ, (newValue) {
                                    widget._client.observ = newValue!;
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    try {
                      final mess = ScaffoldMessenger.of(context);
                      final nav = Navigator.of(context);

                      await widget._controller.save(widget._client);
                      mess.showSnackBar(
                        const SnackBar(
                          content: Text("Información de cliente actualizada"),
                        ),
                      );
                      // Volver a la pantalla anterior
                      nav.pushReplacement(MaterialPageRoute(
                          builder: (context) => const ClientsPage()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error: $e"),
                        ),
                      );
                    }
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
    String inVal;
    widget._client.clientName == "-"
        ? inVal = ""
        : inVal = widget._client.clientName!;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
                initialValue: inVal,
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
    String inVal;
    widget._client.clientPhone == "-"
        ? inVal = ""
        : inVal = widget._client.clientPhone!;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
                initialValue: inVal,
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

  Widget _clientEmail(
      FormFieldValidator<String?> validate, FormFieldSetter<String?> save) {
    String inVal;
    widget._client.clientEmail == "-"
        ? inVal = ""
        : inVal = widget._client.clientEmail!;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
            initialValue: inVal,
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
            validator: validate,
            onSaved: save));
  }

  Widget _age(FormFieldSetter<String?> save) {
    String inVal;
    widget._client.clientAge == "-"
        ? inVal = ""
        : inVal = widget._client.clientAge!;

    return Flexible(
        child: TextFormField(
            initialValue: inVal,
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
    String inVal;
    widget._client.clientHeight == "-"
        ? inVal = ""
        : inVal = widget._client.clientHeight!;
    return Flexible(
        child: TextFormField(
            initialValue: inVal,
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
    String inVal;
    widget._client.clientWeight == "-"
        ? inVal = ""
        : inVal = widget._client.clientWeight!;
    return Flexible(
        child: TextFormField(
            initialValue: inVal,
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

  Widget _garmentSize(
      dynamic garment, String fieldLabel, FormFieldSetter<String?> save) {
    var _garment = garment;
    String inVal;
    _garment == "-" || _garment == 'null' ? inVal = "" : inVal = _garment;

    String _fieldLabel = fieldLabel;

    return Flexible(
        child: TextFormField(
            initialValue: inVal,
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

  Widget _basicField(
      dynamic measure, String fieldLabel, FormFieldSetter<String?> save) {
    var _measure = measure;
    String inVal;
    _measure == "-" || _measure == 'null' ? inVal = "" : inVal = _measure;

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
                initialValue: inVal,
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

  Widget _observ(dynamic observ, FormFieldSetter<String?> save) {
    var _observ = observ;
    String inVal;
    _observ == "-" || _observ == 'null' ? inVal = "" : inVal = _observ;

    return Flexible(
        child: TextFormField(
            initialValue: inVal,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            minLines: 4,
            maxLines: 4,
            maxLength: 200,
            decoration: const InputDecoration(
              counterText: "",
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              hintText: "Alergias, gustos, etc.",
              border: OutlineInputBorder(),
            ),
            onSaved: save));
  }
}
