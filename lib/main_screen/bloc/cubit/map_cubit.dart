import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final Location _locationController = Location();
  
  //MapCubit() : super(MapInitial());

   MapCubit() : super(MapInitial()) {
    _getLocationUpdates();
  }

   Future<void> _getLocationUpdates() async {
    emit(MapLoading());
    
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        emit(MapInitial()); // Retour à l'état initial si le service n'est pas activé
        return;
      }
    }
     _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        emit(MapInitial()); // Retour à l'état initial si la permission est refusée
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        emit(MapLoaded(currentPosition: LatLng(currentLocation.latitude!, currentLocation.longitude!)));
      }
    });
  }

}
