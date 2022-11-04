import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';

class OneClientPage extends StatefulWidget {
  const OneClientPage({super.key});

  @override
  State<OneClientPage> get createState => _OneClientPageState();
}

class _OneClientPageState extends State<OneClientPage> {  
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
                          _clientName(),
                          _clientPhone(),
                          _clientEmail(),
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
                                        _age(),
                                        const SizedBox(width: 10),
                                        _height(),
                                        const SizedBox(width: 10),
                                        _weight(),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Text("Tallas generales"),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        _garmentSize('Blusa'),
                                        const SizedBox(width: 10),
                                        _garmentSize('Pantalón'),
                                        const SizedBox(width: 10),
                                        _garmentSize('Falda'),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                     Row(
                                      children: [
                                        _garmentSize('Brassiere'),
                                        const SizedBox(width: 10),
                                        _garmentSize('Panty'),
                                        const SizedBox(width: 10),
                                        _garmentSize('Calzado'),
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
                                                _basicField('Contorno cuello'),
                                                const SizedBox(width: 10),
                                                _basicField('Ancho hombro'),
                                                const SizedBox(width: 10),
                                                _basicField('Ancho cuello'),
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
                                                _basicField('Ancho de espalda'),
                                                const SizedBox(width: 10),
                                                _basicField('Contorno busto'),
                                                const SizedBox(width: 10),
                                                _basicField('Con torno tórax'),
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
                                                _basicField('Contorno cintura'),
                                                const SizedBox(width: 10),
                                                _basicField('L. talle-espalda'),
                                                const SizedBox(width: 10),
                                                _basicField(
                                                    'L. talle delantero'),
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
                                          _basicField('Altura de busto'),
                                          const SizedBox(width: 10),
                                          _basicField('Separación busto'),
                                          const SizedBox(width: 10),
                                          _basicField('Largo total brazo'),
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
                                          _basicField('L. brazo al codo'),
                                          const SizedBox(width: 10),
                                          _basicField('Contorno brazo'),
                                          const SizedBox(width: 10),
                                          _basicField('Contorno cadera'),
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
                                          _basicField('Altura de cadera'),
                                          const SizedBox(width: 10),
                                          _basicField('Cont 1/2 cadera'),
                                          const SizedBox(width: 10),
                                          _basicField('Largo de tiro'),
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
                                          _basicField('Largo total pierna'),
                                          const SizedBox(width: 10),
                                          _basicField('Contorno pierna'),
                                          const SizedBox(width: 10),
                                          _basicField('Largo a la rodilla'),
                                        ],
                                      ))
                                    ],
                                  ))
                                ],
                              ),
                              const SizedBox(height: 12),
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
                                  Flexible(
                                    child: TextFormField(
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
                                    ),
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
              const SizedBox(height: 8),
              ElevatedButton(
                child: const Text("Guardar"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // TODO: Guardar los datos en la BD

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Cliente registrado"),
                      ),
                    );
                    // Volver a la pantalla anterior
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _clientName() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Debes Ingresar un nombre";
                }
                return null;
              },
            )),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _clientPhone() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Debes Ingresar un teléfono";
                }
                return null;
              },
            )),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget _clientEmail() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
            maxLength: 25,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              labelText: 'E-Mail',
            )));
  }

  Widget _age() {
    return Flexible(
        child: TextFormField(
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '00',
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              suffix: Text(' años'),
              border: OutlineInputBorder(),
              labelText: 'Edad',
            )));
  }

  Widget _height() {
    return Flexible(
        child: TextFormField(
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '00.0',
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              suffix: Text(' m'),
              border: OutlineInputBorder(),
              labelText: 'Estatura',
            )));
  }

  Widget _weight() {
    return Flexible(
        child: TextFormField(
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '00.0',
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              suffix: Text(' Kg'),
              border: OutlineInputBorder(),
              labelText: 'Peso',
            )));
  }

  Widget _garmentSize(String fieldLabel) {
    String _fieldLabel = fieldLabel;

    return Flexible(
        child: TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: '',
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              border: const OutlineInputBorder(),
              labelText: _fieldLabel,
            )));
  }

  Widget _basicField(String fieldLabel) {
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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                  suffix: Text(' cm'),
                  border: OutlineInputBorder(),
                )))
      ],
    ));
  }
}
