part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;
  final LatLng? lastKnownLocation;
  final bool isMapInitialized;


  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;

  const HomeState({
    required this.isGpsEnabled, 
    required this.isGpsPermissionGranted,
    this.lastKnownLocation,
    this.isMapInitialized = false, 
  });

  HomeState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
    LatLng? lastKnownLocation,
    bool? isMapInitialized,
  }) => HomeState(
    isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled, 
    isGpsPermissionGranted: isGpsPermissionGranted ?? this.isGpsPermissionGranted,
    lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
  );
  
  @override
  List<Object> get props => [ isGpsEnabled, isGpsPermissionGranted, isMapInitialized ];

  @override
  String toString() => '{ isGpsEnabled: $isGpsEnabled, isGpsPermissionGranted: $isGpsPermissionGranted }';

}
