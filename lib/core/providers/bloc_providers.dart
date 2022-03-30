import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_seleccion_tyba/core/blocs/home_bloc/home_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
];