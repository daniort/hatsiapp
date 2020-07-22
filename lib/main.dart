import 'package:flutter/material.dart';
import 'package:hatsiapp/Router/strings.dart';
import 'package:hatsiapp/state/loginstate.dart';
import 'package:hatsiapp/widget/login.dart';
import 'package:hatsiapp/widget/principal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      create: (BuildContext context) => LoginState(),
      child: MaterialApp(
        title: 'HatsiApp',
        theme: ThemeData(
          primaryColor: Color(0xFF0076a6),
        ),
        routes: {
          "/": (BuildContext context) {
            if (Provider.of<LoginState>(context, listen: true).islogin()) {
              return Principal();
            } else {
              return LoginPage();
            }
          }
        },
      ),
    );
  }
}
