import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final Location _locationController = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  Timer? _locationTimer;

  MapCubit() : super(MapInitial()) {
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    try {
      // Vérifier et demander les permissions
      bool serviceEnabled = await _locationController.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _locationController.requestService();
        if (!serviceEnabled) {
          emit(MapError('Location service not enabled'));
          return;
        }
      }

      PermissionStatus permissionGranted = await _locationController.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _locationController.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          emit(MapError('Location permission denied'));
          return;
        }
      }

      // Récupérer la position initiale
      LocationData? initialLocation = await _locationController.getLocation();
      if (initialLocation.latitude != null && initialLocation.longitude != null) {
        LatLng initialPosition = LatLng(initialLocation.latitude!, initialLocation.longitude!);
        emit(MapLoaded(currentPosition: initialPosition));
      }

      // Configurer l'écoute des changements de position
      _startLocationUpdates();
    } catch (e) {
      emit(MapError('Error initializing location: ${e.toString()}'));
    }
  }

  void _startLocationUpdates() {
    // Annuler toute subscription existante
    _locationSubscription?.cancel();
    _locationTimer?.cancel();

    // Configurer les paramètres de localisation
    _locationController.changeSettings(
      interval: 5000, // 5 secondes
      distanceFilter: 10, // 10 mètres
    );

    // Utiliser un Timer périodique comme alternative au stream continu
    _locationTimer = Timer.periodic(Duration(seconds: 5), (_) async {
      try {
        LocationData? currentLocation = await _locationController.getLocation();
        if (currentLocation.latitude != null && currentLocation.longitude != null) {
          LatLng currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          emit(MapLoaded(currentPosition: currentPosition));
        }
      } catch (e) {
        emit(MapError('Error updating location: ${e.toString()}'));
      }
    });
  }

  void stopLocationUpdates() {
    // Annuler le timer et la subscription
    _locationSubscription?.cancel();
    _locationTimer?.cancel();

    // Désactiver complètement les services de localisation
    _locationController.enableBackgroundMode(enable: false);
  }

  @override
  Future<void> close() {
    stopLocationUpdates();
    return super.close();
  }
}