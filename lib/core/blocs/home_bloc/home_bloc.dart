import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prueba_seleccion_tyba/gui/themes/map_theme.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  StreamSubscription? gpsServiceSubscription;
  GoogleMapController? _mapController;

  HomeBloc() : super(const HomeState( isGpsEnabled: false, isGpsPermissionGranted: false )) {
    
    on<GpsAndPermissionEvent>((event, emit) => emit( state.copyWith(
        isGpsEnabled: event.isGpsEnabled,
        isGpsPermissionGranted: event.isGpsPermissionGranted
      ))
    );

    on<OnNewUserLocationEvent>((event, emit) {
      emit( 
        state.copyWith(
          lastKnownLocation: event.newLocation,
        )
      );

    });

    on<OnMapInitialzedEvent>( _onInitMap );

    _init();

  }

  Future<void> _init() async {
    final gpsInitStatus = await Future.wait([
      _checkGpsStatus(),
      _isPermissionGranted(),
    ]);

    add( GpsAndPermissionEvent(
      isGpsEnabled: gpsInitStatus[0],
      isGpsPermissionGranted: gpsInitStatus[1],
    ));
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    add(OnNewUserLocationEvent( LatLng( position.latitude, position.longitude ) ));
    moveCamera(LatLng( position.latitude, position.longitude ));
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    gpsServiceSubscription = Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = ( event.index == 1 ) ? true : false;
      add( GpsAndPermissionEvent(
        isGpsEnabled: isEnabled,
        isGpsPermissionGranted: state.isGpsPermissionGranted,
      ));
    });

    return isEnable;  
  }

  void moveCamera( LatLng newLocation ) {
    final cameraUpdate = CameraUpdate.newLatLng( newLocation );
    _mapController?.animateCamera(cameraUpdate);
  }

  Future<void> askGpsAccess() async {

    final status = await Permission.location.request();

    switch ( status ) {
      case PermissionStatus.granted:
        add( GpsAndPermissionEvent(isGpsEnabled: state.isGpsEnabled, isGpsPermissionGranted: true) );
        break;
      
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add( GpsAndPermissionEvent(isGpsEnabled: state.isGpsEnabled, isGpsPermissionGranted: false) );
        openAppSettings();
    }

  }

  void _onInitMap( OnMapInitialzedEvent event, Emitter<HomeState> emit ) {

    _mapController = event.controller;
    _mapController!.setMapStyle( jsonEncode( map_theme ));

    emit( state.copyWith( isMapInitialized: true ) );

  }

  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }

}
