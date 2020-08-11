import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hatsiapp/widget/new_platillo.dart';

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
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('restaurantes')
                          .document()
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
                          return a['nombre'].compareTo(b['nombre']);
                        });
                        return ListView.builder(
                          itemCount: (docs.length),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data = docs[index].data;
                            return ExpansionTile(
                              backgroundColor: Color(0x1D605e5f),
                              title: Text(
                                data['nombre'],
                                style: TextStyle(
                                    color: Color(0xFF262626),
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(data['nota']),
                              children: <Widget>[
                                ListTile(
                                  title: Text(' ingredientes: '),
                                ),
                                ListTile(
                                  title: Text(data['ingredienteuno']),
                                ),
                                ListTile(
                                  title: Text(data['ingredientedos']),
                                ),
                                ListTile(
                                  title: Text(data['ingredientetres']),
                                ),
                                ListTile(
                                  title: Text(' porcion: ' + data['tamaño']),
                                ),
                                ListTile(
                                  title: Text(' precio: ' + data['precio']),
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
