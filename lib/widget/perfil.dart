import 'package:flutter/material.dart';
import 'package:hatsiapp/widget/datos_rest.dart';

class Perfil extends StatelessWidget {
  Widget build(BuildContext context) {
    //final _user = Provider.of<LoginState>(context, listen: false).currentUser();
    //UserServices().newUser(_user);
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Editar(),
                    ),
                  );
                },
                child: Container(
                  height: alto * .05,
                  width: ancho * .25,
                  decoration: BoxDecoration(
                    color: Colors.black12,
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
          Expanded(
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: alto * .25,
                        height: alto * .25,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(20, 20, 20, 0.2),
                              width: 5.0),
                          boxShadow: [
                            BoxShadow(color: Colors.white10, blurRadius: 25)
                          ],
                          borderRadius: BorderRadius.circular(150),
                        ),
                      ),
                    ),
                    Text(
                      "Restaurant",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff484349),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "Nombre del retaurante",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff484349),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Tipo de comida",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff484349),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Direccion",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff484349),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Telefono",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff484349),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Piso",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff484349),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
