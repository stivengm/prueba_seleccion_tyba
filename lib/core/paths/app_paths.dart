import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/gui/views/home_view/home_view.dart';
import 'package:prueba_seleccion_tyba/gui/views/login_view/login_view.dart';
import 'package:prueba_seleccion_tyba/gui/views/register/register_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'login':    ( _ ) => const LoginView(),
  'home':     ( _ ) => const HomeView(),
  'register': ( _ ) => const RegisterView(),
};