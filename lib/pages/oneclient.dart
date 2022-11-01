import 'package:flutter/material.dart';

class OneClientPage extends StatefulWidget {
  const OneClientPage({super.key});

  @override
  State<OneClientPage> createState() => _OneClientPageState();
}

class _OneClientPageState extends State<OneClientPage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Datos Cliente',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'assets/appbarlogo.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ), // Reemplazar por appBar widget
      // Aqui va el cuerpo de la app
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
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
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: TextFormField(
                                      maxLength: 60,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(6),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
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
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: TextFormField(
                                      maxLength: 25,
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(6),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
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
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: TextFormField(
                                        maxLength: 25,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(6),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
                                          ),
                                          labelText: 'E-Mail',
                                        )))
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
                                          const Text("Datos "),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.right,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '00',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        suffix: Text(' años'),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Edad',
                                                      ))),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.right,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '00.0',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        suffix: Text(' m'),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Estatura',
                                                      ))),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.right,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '00.0',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        suffix: Text(' Kg'),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Peso',
                                                      ))),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          const Text("Tallas generales"),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        suffix: Text(' '),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Blusa',
                                                      ))),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Pantalón',
                                                      ))),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Falda',
                                                      )))
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Brassier',
                                                      ))),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Panty',
                                                      ))),
                                              const SizedBox(width: 10),
                                              Flexible(
                                                  child: TextFormField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: '',
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        suffix: Text(''),
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: 'Calzado',
                                                      )))
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
                                          const Text(
                                              "Medidas específicas 1 de 3"),
                                          const SizedBox(height: 15),
                                          Row(
                                            children: [
                                              Flexible(
                                                  child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              0, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                              child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const Text(
                                                                          'Contorno cuello',
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          )),
                                                                      const SizedBox(
                                                                        height:
                                                                            3,
                                                                      ),
                                                                      Container(
                                                                          width:
                                                                              100,
                                                                          decoration:
                                                                              const BoxDecoration(),
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
                                                                  )),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Flexible(
                                                                  child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                      'Ancho hombro',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Container(
                                                                      width:
                                                                          100,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: TextFormField(
                                                                          textAlign: TextAlign.center,
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: const InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.all(8),
                                                                            suffix:
                                                                                Text(' cm'),
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                          )))
                                                                ],
                                                              )),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Flexible(
                                                                  child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                      'Ancho cuello',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Container(
                                                                      width:
                                                                          100,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: TextFormField(
                                                                          textAlign: TextAlign.center,
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: const InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.all(8),
                                                                            suffix:
                                                                                Text(' cm'),
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                          )))
                                                                ],
                                                              ))
                                                            ],
                                                          ))
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
                                                  Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              0, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                              child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const Text(
                                                                          'Ancho espalda',
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          )),
                                                                      const SizedBox(
                                                                        height:
                                                                            3,
                                                                      ),
                                                                      Container(
                                                                          width:
                                                                              100,
                                                                          decoration:
                                                                              const BoxDecoration(),
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
                                                                  )),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Flexible(
                                                                  child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                      'Contorno busto',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Container(
                                                                      width:
                                                                          100,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: TextFormField(
                                                                          textAlign: TextAlign.center,
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: const InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.all(8),
                                                                            suffix:
                                                                                Text(' cm'),
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                          )))
                                                                ],
                                                              )),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Flexible(
                                                                  child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                      'Contorno tórax',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Container(
                                                                      width:
                                                                          100,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: TextFormField(
                                                                          textAlign: TextAlign.center,
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: const InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.all(8),
                                                                            suffix:
                                                                                Text(' cm'),
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                          )))
                                                                ],
                                                              ))
                                                            ],
                                                          ))
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
                                                  Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              0, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                              child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const Text(
                                                                          'Contorno cintura',
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          )),
                                                                      const SizedBox(
                                                                        height:
                                                                            3,
                                                                      ),
                                                                      Container(
                                                                          width:
                                                                              100,
                                                                          decoration:
                                                                              const BoxDecoration(),
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
                                                                  )),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Flexible(
                                                                  child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                      'L. talle espalda',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Container(
                                                                      width:
                                                                          100,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: TextFormField(
                                                                          textAlign: TextAlign.center,
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: const InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.all(8),
                                                                            suffix:
                                                                                Text(' cm'),
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                          )))
                                                                ],
                                                              )),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Flexible(
                                                                  child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                      'L talle delantero',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Container(
                                                                      width:
                                                                          100,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: TextFormField(
                                                                          textAlign: TextAlign.center,
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: const InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.all(8),
                                                                            suffix:
                                                                                Text(' cm'),
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                          )))
                                                                ],
                                                              ))
                                                            ],
                                                          ))
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
                                            Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                        child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    'Altura de busto',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 3,
                                                                ),
                                                                Container(
                                                                    width: 100,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: TextFormField(
                                                                        textAlign: TextAlign.center,
                                                                        keyboardType: TextInputType.number,
                                                                        decoration: const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                              ],
                                                            )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Separación busto',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Largo total brazo',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        ))
                                                      ],
                                                    ))
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
                                            Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                        child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    'L. brazo al codo',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 3,
                                                                ),
                                                                Container(
                                                                    width: 100,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: TextFormField(
                                                                        textAlign: TextAlign.center,
                                                                        keyboardType: TextInputType.number,
                                                                        decoration: const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                              ],
                                                            )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Contorno brazo',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Contorno cadera',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        ))
                                                      ],
                                                    ))
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
                                            Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                        child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    'Altura de cadera',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 3,
                                                                ),
                                                                Container(
                                                                    width: 100,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: TextFormField(
                                                                        textAlign: TextAlign.center,
                                                                        keyboardType: TextInputType.number,
                                                                        decoration: const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                              ],
                                                            )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Cont 1/2 cadera',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Largo de tiro',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        ))
                                                      ],
                                                    ))
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
                                            Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                        child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    'Largo total pierna',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    )),
                                                                const SizedBox(
                                                                  height: 3,
                                                                ),
                                                                Container(
                                                                    width: 100,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: TextFormField(
                                                                        textAlign: TextAlign.center,
                                                                        keyboardType: TextInputType.number,
                                                                        decoration: const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                              ],
                                                            )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Contorno pierna',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        )),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                            child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                'Largo a la rodilla',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                )),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            Container(
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              EdgeInsets.all(8),
                                                                          suffix:
                                                                              Text(' cm'),
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        )))
                                                          ],
                                                        ))
                                                      ],
                                                    ))
                                                  ],
                                                ))
                                          ],
                                        ))
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            textInputAction:
                                                TextInputAction.done,
                                            minLines: 4,
                                            maxLines: 4,
                                            decoration: const InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                              hintText:
                                                  "Alergias, gustos, etc.",
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
          ),
        ),
      ),
    );
  }
}
