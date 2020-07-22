import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatsiapp/service/service.dart';

class NewPlatillo extends StatefulWidget {
  @override
  _NewPlatilloState createState() => _NewPlatilloState();
}

class _NewPlatilloState extends State<NewPlatillo> {
  TextEditingController _nameplatilloController;
  TextEditingController _ingrediente1Controller;
  TextEditingController _ingrediente2Controller;
  TextEditingController _ingrediente3Controller;
  TextEditingController _porcionController;
  TextEditingController _precioController;
  TextEditingController _notaController;
  void initState() {
    _nameplatilloController = TextEditingController();
    _ingrediente1Controller = TextEditingController();
    _ingrediente2Controller = TextEditingController();
    _ingrediente3Controller = TextEditingController();
    _porcionController = TextEditingController();
    _precioController = TextEditingController();
    _notaController = TextEditingController();
    super.initState();
  }

  String nombrepla;
  String ingrediente1;
  String ingrediente2;
  String ingrediente3;
  String porcion;
  String precio;
  String nota;
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
          'Agregar Platillo',
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Expanded(
                  child: Form(
                    key: _llave,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 40.0, right: 40.0),
                            child: Text(
                              'Necesitamos los datos de sus platillos para que el cliente lo vea y pueda elegir',
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
                              top: 15.0, left: 15.0, right: 15.0, bottom: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: TextFormField(
                              controller: _nameplatilloController,
                              cursorColor: Color(0xff11151C),
                              decoration: InputDecoration(
                                  labelText: 'Nombre del Platillo',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                BlacklistingTextInputFormatter(RegExp("[0-9]")),
                              ],
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return "Escriba nombre del platillo";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0, bottom: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: TextFormField(
                              controller: _ingrediente1Controller,
                              cursorColor: Color(0xff11151C),
                              decoration: InputDecoration(
                                  labelText: 'Ingrediente 1',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                BlacklistingTextInputFormatter(RegExp("[0-9]")),
                              ],
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return "Escriba ingrediente del platillo";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0, bottom: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: TextFormField(
                              controller: _ingrediente2Controller,
                              cursorColor: Color(0xff11151C),
                              decoration: InputDecoration(
                                  labelText: 'Ingrediente 2',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                BlacklistingTextInputFormatter(RegExp("[0-9]")),
                              ],
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return "Escriba ingrediente del platillo";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0, bottom: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: TextFormField(
                              controller: _ingrediente3Controller,
                              cursorColor: Color(0xff11151C),
                              decoration: InputDecoration(
                                  labelText: 'Ingrediente 3(de ser necesario)',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                BlacklistingTextInputFormatter(RegExp("[0-9]")),
                              ],
                              autocorrect: false,
                              validator: (value) {
                                if (value.isNotEmpty && value.length < 4) {
                                  return "Escriba ingrediente del platillo";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0, bottom: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: TextFormField(
                              controller: _porcionController,
                              cursorColor: Color(0xff11151C),
                              decoration: InputDecoration(
                                  labelText: 'Porcion/Tamaño(gramos)',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return "Escriba la porcion del platillo";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0, bottom: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: TextFormField(
                              controller: _precioController,
                              cursorColor: Color(0xff11151C),
                              decoration: InputDecoration(
                                  labelText: 'Precio',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return "Escriba el precio del platillo";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0, bottom: 60.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: TextFormField(
                              controller: _notaController,
                              cursorColor: Color(0xff11151C),
                              decoration: InputDecoration(
                                  labelText: 'Nota(sobre el platillo)',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                BlacklistingTextInputFormatter(RegExp("[0-9]")),
                              ],
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return "Escriba algo sobre el platillo";
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
                height: alto * .07,
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
                          if (_llave.currentState.validate()) {
                            Userservice().platillo(
                              nombrepla = _nameplatilloController.text,
                              ingrediente1 = _ingrediente1Controller.text,
                              ingrediente2 = _ingrediente2Controller.text,
                              ingrediente3 = _ingrediente3Controller.text,
                              porcion = _porcionController.text,
                              precio = _precioController.text,
                              nota = _notaController.text,
                            );
                            Navigator.pop(context);
                            _nameplatilloController.clear();
                            _ingrediente1Controller.clear();
                            _ingrediente2Controller.clear();
                            _ingrediente3Controller.clear();
                            _porcionController.clear();
                            _precioController.clear();
                            _notaController.clear();
                          }
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
    );
  }
}
