import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  //static const LatLng _pSogbossito = LatLng(6.2089, 1.2130);
  static const LatLng _pApplePark = LatLng(37.3349, -122.0090);
  static const LatLng _pGooglePlex = LatLng(37.4220, -122.0841);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is MapInitial || state is MapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoaded) {
            return FutureBuilder(
              future: Future.delayed(
                  const Duration(seconds: 1)), // Ajoutez un délai de 1 seconde
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _mapController.complete(controller);
                    },
                    initialCameraPosition: CameraPosition(
                      target: state.currentPosition,
                      zoom: 15,
                    ),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    compassEnabled: true,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                    rotateGesturesEnabled: true,
                    markers: {
                      Marker(
                        markerId: const MarkerId('_currentLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: state.currentPosition,
                      ),
                      const Marker(
                        markerId: MarkerId('_sourceLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pGooglePlex,
                      ),
                      const Marker(
                        markerId: MarkerId('_destinationLocation'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pApplePark,
                      ),
                    },
                  );
                }
                // Affichez un indicateur de chargement pendant le délai
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
          return const Center(child: Text('Failed to load map'));
        },
      ),
    );
  }
}
