import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Userservice {
  void platillo(
    FirebaseUser user,
    String nombrepla,
    String ingrediente1,
    String ingrediente2,
    String ingrediente3,
    int porcion,
    int precio,
    String nota,
  ) {
    try {
      Firestore.instance
          .collection('restaurantes')
          .document(user.uid)
          .collection('platillos')
          .document()
          .setData({
        "nombre": nombrepla,
        "ingredienteuno": ingrediente1,
        "ingredientedos": ingrediente2,
        "ingredientetres": ingrediente3,
        "tamaño": porcion,
        "precio": precio,
        "nota": nota
      });
    } catch (e) {
      print('Error al guardar el platillo');
    }
  }

  void datosRestaurant(
    FirebaseUser user,
    String nombre,
    String direccion,
    int piso,
    int telefono,
    String correo,
    int sucursales,
    String tipo,
  ) {
    try {
      Firestore.instance
          .collection('restaurantes')
          .document(user.uid)
          .collection('datos')
          .document()
          .setData({
        "nombre": nombre,
        "direccion": direccion,
        "piso": piso,
        "telefono": telefono,
        "correo": correo,
        "sucursales": sucursales,
        "tipo": tipo,
      });
    } catch (e) {
      print('Error al guardar los datos del restaurant');
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
