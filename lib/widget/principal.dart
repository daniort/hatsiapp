import 'package:flutter/material.dart';
import 'package:hatsiapp/Router/strings.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: alto * .4,
              width: ancho,
              child: Center(
                child: Image.asset('lib/asset/menu.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: alto * .05,
                  width: ancho * .2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Salir',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, editarRoute);
                  },
                  child: Container(
                    height: alto * .05,
                    width: ancho * .25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 5),
                        Icon(
                          Icons.edit,
                          size: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Editar',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, newplatilloRoute);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
