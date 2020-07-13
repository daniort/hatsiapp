import 'package:hatsiapp/Router/generaRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatsiapp/main.dart';
import 'package:hatsiapp/widget/datos_rest.dart';
import 'package:hatsiapp/widget/principal.dart';

class Router {
  Route<dynamic> generaRouter(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(builder: (_) => MyApp());
      case principal:
        return MaterialPageRoute(builder: (_) => Principal());
      case editar:
        return MaterialPageRoute(builder: (_) => Editar());
    }
  }
}
