import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hatsiapp/Router/strings.dart';
import 'package:hatsiapp/state/loginstate.dart';
import 'package:hatsiapp/widget/datos_rest.dart';
import 'package:hatsiapp/widget/new_platillo.dart';
import 'package:provider/provider.dart';

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
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: alto * .39,
                    width: ancho,
                    child: Center(
                      child: Image.asset('lib/asset/images/menu.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: InkWell(
                      onTap: () {
                        context.read<LoginState>().logout();
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
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('platillos')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<DocumentSnapshot> docs = snapshot.data.documents;

                        docs.sort((a, b) {
                          return a['Nombre'].compareTo(b['Nombre']);
                        });
                        return ListView.builder(
                          itemCount: (docs.length),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data = docs[index].data;
                            return ExpansionTile(
                              backgroundColor: Color(0x1D605e5f),
                              title: Text(
                                data['Nombre'],
                                style: TextStyle(
                                    color: Color(0xFF262626),
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(data['Nota']),
                              children: <Widget>[
                                ListTile(
                                  title: Text(' Ingredientes: '),
                                ),
                                ListTile(
                                  title: Text(data['Ingredienteuno']),
                                ),
                                ListTile(
                                  title: Text(data['Ingredientedos']),
                                ),
                                ListTile(
                                  title: Text(data['Ingredientetres']),
                                ),
                                ListTile(
                                  title: Text(' Porcion: ' + data['Tamaño']),
                                ),
                                ListTile(
                                  title: Text(' Precio: ' + data['Precio']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0,
                                      right: 8.0,
                                      left: 8.0,
                                      bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        height: alto * .045,
                                        width: ancho * .4,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text('Editar'),
                                        ),
                                      ),
                                      Container(
                                        height: alto * .045,
                                        width: ancho * .4,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text('Eliminar'),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, right: 15),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewPlatillo(),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
