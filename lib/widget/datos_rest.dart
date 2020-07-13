import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Editar extends StatefulWidget {
  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  TextEditingController _nameresController;
  void initState() {
    _nameresController = TextEditingController();
    super.initState();
  }

  final _llave = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff6f4f3),
      appBar: AppBar(
        backgroundColor: Color(0xfff6f4f3),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Text(
          'Editar Datos',
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _llave,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 40.0, right: 40.0),
                              child: Text(
                                'Necesitamos los datos de su restaurante para que que los clientes hagan sus pedidos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12),
                              child: TextFormField(
                                controller: _nameresController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    labelText: 'Nombre del restaurante',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 4) {
                                    return "Nombre Incompleto";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12),
                              child: TextFormField(
                                controller: _nameresController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    labelText: 'Direccion',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 4) {
                                    return "Nombre Incompleto";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12),
                              child: TextFormField(
                                controller: _nameresController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    labelText: 'Piso/oficina (Opcional)',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 4) {
                                    return "Nombre Incompleto";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12),
                              child: TextFormField(
                                controller: _nameresController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    labelText: 'Numero de telefono',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 4) {
                                    return "Nombre Incompleto";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12),
                              child: TextFormField(
                                controller: _nameresController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    labelText: 'Correo electronico',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 4) {
                                    return "Nombre Incompleto";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12),
                              child: TextFormField(
                                controller: _nameresController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    labelText: 'Numero de ubicaciones',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 4) {
                                    return "Nombre Incompleto";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 60.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black12),
                              child: TextFormField(
                                controller: _nameresController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    labelText: 'Tipo de Cocina',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[0-9]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isNotEmpty && value.length < 4) {
                                    return "Nombre Incompleto";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black87,
                    Color(0xff4c5b5c),
                  ])),
                  height: alto * .06,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              'Enviar datos',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
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
    );
  }
}
