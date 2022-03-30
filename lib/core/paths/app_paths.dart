import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/gui/templates/zoom_drawer.dart';
import 'package:prueba_seleccion_tyba/gui/views/login_view/login_view.dart';
import 'package:prueba_seleccion_tyba/gui/views/register/register_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'login':    ( _ ) => const LoginView(),
  'home':     ( _ ) => const ZoomDrawerApp(),
  'register': ( _ ) => const RegisterView(),
};