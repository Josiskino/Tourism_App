import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  //static const LatLng _pGooglePlex = LatLng(37.7749, -122.4194);
  // Coordonnées pour Agoè-Sogbossito, Lomé, Togo
  static const LatLng _pSogbossito = LatLng(6.2089, 1.2130);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is MapInitial) {
            return const Center(child: Text('Loading...'));
          } else if (state is MapLoaded) {
            return GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: state.currentPosition, zoom: 15),
              markers: {
                Marker(
                  markerId: const MarkerId('_currentLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: state.currentPosition,
                ),
                const Marker(
                  markerId: MarkerId('_sourceLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pSogbossito,
                ),
              },
            );
          }
          return const Center(child: Text('Failed to load map'));
        },
      ),
    );
  }
}