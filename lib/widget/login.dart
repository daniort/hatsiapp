import 'package:flutter/material.dart';
import 'package:hatsiapp/Router/strings.dart';
import 'package:hatsiapp/error/color.dart';
import 'package:hatsiapp/state/loginstate.dart';
import 'package:hatsiapp/widget/registro.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passController;

  final _formLogin = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    final _state = Provider.of<LoginState>(context, listen: true);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Hatsi!',
                      style: TextStyle(fontSize: 40, fontFamily: 'Chasy'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('For restaurant'),
                  ),
                  Expanded(
                    child: Image.asset('lib/asset/images/resta.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Entra y sigue compartiendo con todos tus platillos más deliciosos.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _state.isMsn()
                      ? Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                  "Enviamos un link de verificación a tu correo, entra en él para activar tu cuenta.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkBackground,
                                  )),
                            ),
                          ),
                        )
                      : Form(
                          key: _formLogin,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.mail),
                                      labelText: 'Correo Electronico',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Necesitamos tu correo";
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.vpn_key),
                                        labelText: 'Contraseña'),
                                    controller: _passController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.length < 6) {
                                        return "La contraseña es muy corta.";
                                      }
                                      if (value.isEmpty) {
                                        return "Esto es muy importante";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 5.0, top: 2.0),
                    child: InkWell(
                      onTap: () async {
                        if (_formLogin.currentState.validate()) {
                          try {
                            _state.loginIn(
                              _emailController.text,
                              _passController.text,
                            );
                          } catch (e) {
                            _state.salioError(e);
                          }
                        }
                      },
                      child: Container(
                        width: ancho,
                        height: alto * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: _state.isError()
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.redBackground, Colors.red])
                              : LinearGradient(
                                  colors: [Colors.grey[800], Colors.grey[900]]),
                        ),
                        child: Center(
                          child: _state.isloading()
                              ? CircularProgressIndicator()
                              : Text(
                                  'Ingresar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ),
                  _state.isError()
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 20.0),
                          child: Text(
                            _state.errorM,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 20.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registro(),
                                  ),
                                );
                              },
                              child: Text(
                                  '¿Aún no eres parte de nosotros?\n Registrate Aquí',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13))),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
