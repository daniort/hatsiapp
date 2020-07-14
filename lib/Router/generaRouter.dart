import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatsiapp/Router/strings.dart';
import 'package:hatsiapp/main.dart';
import 'package:hatsiapp/widget/datos_rest.dart';
import 'package:hatsiapp/widget/new_platillo.dart';
import 'package:hatsiapp/widget/principal.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case mainRoute:
      return MaterialPageRoute(builder: (_) => MyHomePage());
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
