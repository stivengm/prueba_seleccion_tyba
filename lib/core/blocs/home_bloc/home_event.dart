part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


class GpsAndPermissionEvent extends HomeEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  const GpsAndPermissionEvent({
    required this.isGpsEnabled, 
    required this.isGpsPermissionGranted
  });
}

class OnNewUserLocationEvent extends HomeEvent {
  final LatLng newLocation;
  const OnNewUserLocationEvent(this.newLocation);
}

class OnMapInitialzedEvent extends HomeEvent {
  final GoogleMapController controller;
  const OnMapInitialzedEvent(this.controller);
}
