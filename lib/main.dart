import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]).then((_) {
  //   runApp(MyApp());
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            theme: CupertinoThemeData(
                primaryColor: Colors.green,
                primaryContrastingColor: Colors.green,
                barBackgroundColor: Colors.green),
            home: MyHomePage(),
          )
        : MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.green,
              primaryColor: Colors.green,
              accentColor: Colors.green,
              errorColor: Colors.red,
              appBarTheme: AppBarTheme(),
            ),
            home: MyHomePage(),
          );
  }
}
