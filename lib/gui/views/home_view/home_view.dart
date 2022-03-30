import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prueba_seleccion_tyba/core/blocs/home_bloc/home_bloc.dart';
import 'package:prueba_seleccion_tyba/gui/widgets/input_border_widget.dart';
import 'package:prueba_seleccion_tyba/gui/widgets/primary_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final CameraPosition initialCameraPosition = CameraPosition(
      target: (homeBloc.state.lastKnownLocation != null) ? homeBloc.state.lastKnownLocation! : const LatLng(37.43296265331129, -122.08832357078792),
      zoom: 15
    );
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
              ),
            ),
            floatingActionButton: state.isAllGranted ? FloatingActionButton(
              child: const Icon(Icons.location_on_outlined),
              onPressed: () => homeBloc.getCurrentPosition(),
            ) : null,
            body: _body(initialCameraPosition));
      },
    );
  }

  Widget _body(initialCameraPosition) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecorations.inputDecoration(labelText: 'Ciudad'),
            ),
            const SizedBox(height: 15.0),
            PrimaryButton(text: 'Buscar', onPressed: () {}),
            !homeBloc.state.isGpsPermissionGranted ? const SizedBox(height: 15.0) : const SizedBox(),
            !homeBloc.state.isGpsPermissionGranted ? PrimaryButton(text: 'Permisos de ubicación', onPressed: getPermissosLocation) : const SizedBox(),
            const SizedBox(height: 15.0),
            homeBloc.state.isAllGranted ? Expanded(
              child: GoogleMap(
                initialCameraPosition: initialCameraPosition,
                compassEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                onMapCreated: ( controller ) => homeBloc.add( OnMapInitialzedEvent(controller) ),
              ),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }

  getPermissosLocation() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.askGpsAccess();
  }
}
