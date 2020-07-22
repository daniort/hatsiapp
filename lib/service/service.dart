import 'package:cloud_firestore/cloud_firestore.dart';

class Userservice {
  void platillo(
    String nombrepla,
    String ingrediente1,
    String ingrediente2,
    String ingrediente3,
    String porcion,
    String precio,
    String nota,
  ) {
    try {
      Firestore.instance.collection('platillos').document().setData({
        "Nombre": nombrepla,
        "Ingredienteuno": ingrediente1,
        "Ingredientedos": ingrediente2,
        "Ingredientetres": ingrediente3,
        "Tamaño": porcion,
        "Precio": precio,
        "Nota": nota
      });
    } catch (e) {
      print('Error al guardar el platillo');
    }
  }
}

class UserLogin {
  String nombre;
  String correo;
  String telefono;
  String uid;

  UserLogin({this.nombre, this.correo, this.telefono, this.uid});

  UserLogin.fromJson(Map<String, dynamic> parsedJSON)
      : nombre = parsedJSON['name'],
        correo = parsedJSON['age'],
        telefono = parsedJSON['telefono'];
}
