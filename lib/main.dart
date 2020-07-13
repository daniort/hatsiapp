import 'package:flutter/material.dart';
import 'package:hatsiapp/Router/generaRouter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HatsiApp',
      theme: ThemeData(
        primaryColor: Color(0xFF0076a6),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Hatsi!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Text('For restaurante'),
              Expanded(
                  child: Container(
                child: Image.asset('lib/asset/main.jpg'),
              )),
              Text(
                'Bienvenido',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Entra y sigue compartiendo con todos tus platillos más deliciosos.',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, principal);
                  },
                  child: Container(
                    height: alto * .07,
                    width: ancho,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff4c5b5c)),
                    child: Center(
                      child: Text(
                        'Ingresar',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Text('¿Aún no eres parte de nosotros?'),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InkWell(onTap: () {}, child: Text('Registrate Aqui')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
