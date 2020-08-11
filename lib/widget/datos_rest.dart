import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatsiapp/service/service.dart';
import 'package:hatsiapp/state/loginstate.dart';
import 'package:provider/provider.dart';

class Editar extends StatefulWidget {
  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  TextEditingController _nameresController;
  TextEditingController _direccionController;
  TextEditingController _pisoController;
  TextEditingController _telefonoController;
  TextEditingController _correoController;
  TextEditingController _sucursalController;
  TextEditingController _tipoController;
  void initState() {
    _nameresController = TextEditingController();
    _direccionController = TextEditingController();
    _pisoController = TextEditingController();
    _telefonoController = TextEditingController();
    _correoController = TextEditingController();
    _sucursalController = TextEditingController();
    _tipoController = TextEditingController();

    super.initState();
  }

  String nombre;
  String direccion;
  int piso;
  int telefono;
  String correo;
  int sucursales;
  String tipo;

  final _llave = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<LoginState>(context, listen: false).currentUser();
    final alto = MediaQuery.of(context).size.height;
    //final ancho = MediaQuery.of(context).size.width;
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
                                'Necesitamos los datos de su restaurante para que se muestren a los clientes',
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
                                    prefixIcon: Icon(Icons.restaurant),
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
                                  if (value.isEmpty) {
                                    return "Agrega el nombre";
                                  }
                                  if (value.length < 4) {
                                    return "Nombre incompleto";
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
                                controller: _direccionController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.store_mall_directory),
                                    labelText: 'Direccion',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return "Direccion Incompleta";
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
                                controller: _pisoController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.home),
                                    labelText: 'Piso/oficina (Opcional)',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[A-Z],[a-z]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Campo incompleto";
                                  }
                                  if (value.length >= 3) {
                                    return "Formato incompleto";
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
                                controller: _telefonoController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    labelText: 'Numero de telefono',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[A-Z],[a-z]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Agrega el Telefono";
                                  }
                                  if (value.length <= 9 && value.length >= 11) {
                                    return "Deben de ser 10 digitos";
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
                                controller: _correoController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    labelText: 'Correo electronico',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Correo Incompleto";
                                  }
                                  RegExp regExp =
                                      new RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                  if (!regExp.hasMatch(value.toString())) {
                                    return "Formato incorrecto";
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
                                controller: _sucursalController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.home),
                                    labelText: 'Numero de ubicaciones',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  BlacklistingTextInputFormatter(
                                      RegExp("[A-Z, a-z]")),
                                ],
                                autocorrect: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Agrega el numero de ubicaciones";
                                  }
                                  if (value.length < 1 || value.length > 3) {
                                    return "Formato invalido";
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
                                controller: _tipoController,
                                cursorColor: Color(0xff11151C),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.restaurant_menu),
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
                                  if (value.isEmpty) {
                                    return "Agrega el tipo de cocina";
                                  }
                                  if (value.length < 4) {
                                    return "Dato incompleto";
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
                            if (_llave.currentState.validate()) {
                              Userservice().datosRestaurant(
                                _user,
                                nombre = _nameresController.text,
                                direccion = _direccionController.text,
                                piso = _pisoController.text as int,
                                telefono = _telefonoController.text as int,
                                correo = _correoController.text,
                                sucursales = _sucursalController.text as int,
                                tipo = _tipoController.text,
                              );
                              Navigator.pop(context);
                              _nameresController.clear();
                              _direccionController.clear();
                              _pisoController.clear();
                              _telefonoController.clear();
                              _correoController.clear();
                              _sucursalController.clear();
                              _tipoController.clear();
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
      ),
    );
  }
}
