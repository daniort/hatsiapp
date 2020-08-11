import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  Pedidos({Key key}) : super(key: key);

  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: ancho * .7,
              height: alto * .05,
              color: Colors.red,
              child: Text('Pedido por Confirmar'),
            ),
            Container(
              width: ancho,
              height: alto * .05,
              color: Colors.yellow,
              child: Text('Pedido en proceso'),
            ),
            Container(
              width: ancho,
              height: alto * .05,
              color: Colors.green,
              child: Text('Pedido entregado'),
            ),
          ],
        ),
      ),
    );
  }
}
