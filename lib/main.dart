import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/core/paths/app_paths.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: routesApp(),
      initialRoute: 'login',
    );
  }
}
