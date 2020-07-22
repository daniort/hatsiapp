import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatsiapp/Router/strings.dart';
import 'package:hatsiapp/main.dart';
import 'package:hatsiapp/widget/datos_rest.dart';
import 'package:hatsiapp/widget/login.dart';
import 'package:hatsiapp/widget/new_platillo.dart';
import 'package:hatsiapp/widget/principal.dart';
import 'package:hatsiapp/widget/registro.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case mainRoute:
      return MaterialPageRoute(builder: (_) => MyApp());
    case loginRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case registroRoute:
      return MaterialPageRoute(builder: (_) => Registro());
    case principalRoute:
      return MaterialPageRoute(builder: (_) => Principal());
    case editarRoute:
      return MaterialPageRoute(builder: (_) => Editar());
    case newplatilloRoute:
      return MaterialPageRoute(builder: (_) => NewPlatillo());
    default:
      return MaterialPageRoute(builder: (_) => MyApp());
  }
}
