import 'package:flutter/material.dart';
import 'package:hatsiapp/widget/pedidos.dart';
import 'package:hatsiapp/widget/perfil.dart';
import 'package:provider/provider.dart';
import 'package:hatsiapp/state/loginstate.dart';
import 'package:hatsiapp/widget/datos_rest.dart';

import 'package:hatsiapp/widget/principal.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int page = 1;
  final List<Widget> lista = [
    Perfil(),
    Principal(),
    Editar(),
  ];
  Widget inicio = Principal();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    //final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff6f9ff),
      body: PageStorage(
        child: inicio,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      inicio = Perfil();
                      page = 0;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: page == 0
                          ? Color(0xff484349)
                          : Color.fromRGBO(20, 20, 20, 0.4),
                      size: 30,
                    ),
                    Text(
                      'Perfil',
                      style: TextStyle(
                        color: page == 0
                            ? Color(0xff484349)
                            : Color.fromRGBO(20, 20, 20, 0.4),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      inicio = Principal();
                      page = 1;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.restaurant_menu,
                        color: page == 1
                            ? Color(0xff484349)
                            : Color.fromRGBO(20, 20, 20, 0.4),
                        size: 30),
                    Text(
                      'Platillos',
                      style: TextStyle(
                        color: page == 0
                            ? Color(0xff484349)
                            : Color.fromRGBO(20, 20, 20, 0.4),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      inicio = Pedidos();
                      page = 2;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.view_list,
                        color: page == 2
                            ? Color(0xff484349)
                            : Color.fromRGBO(20, 20, 20, 0.4),
                        size: 30),
                    Text(
                      'Pedidos',
                      style: TextStyle(
                        color: page == 0
                            ? Color(0xff484349)
                            : Color.fromRGBO(20, 20, 20, 0.4),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: Center(child: Text('Cerrar Sesión')),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Provider.of<LoginState>(context,
                                          listen: false)
                                      .logout();
                                },
                                color: Color(0xffee6179),
                                child: Text(
                                  'Salir',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                            content: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '¿Estas seguro de salir?',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text:
                                        'Ya no podrás seguir agregando tus platillos',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ));
                      });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Color.fromRGBO(20, 20, 20, 0.5),
                      size: 30,
                    ),
                    Text(
                      'Salir',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
