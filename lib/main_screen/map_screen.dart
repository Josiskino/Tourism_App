import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  void dispose() {
    // Arrêter les services de localisation du Cubit
    context.read<MapCubit>().stopLocationUpdates();
    super.dispose();
  }

  // Sites touristiques avec des URLs d'images génériques
  final List<TouristSite> _touristSites = [
    TouristSite(
        name: 'Site Historique 1',
        description: 'Un site historique fascinant avec une riche histoire',
        distance: '2 km',
        rating: 4.5,
        imageUrl: 'https://picsum.photos/id/1/400/300'),
    TouristSite(
        name: 'Parc Naturel',
        description: 'Un magnifique parc avec une biodiversité exceptionnelle',
        distance: '3.5 km',
        rating: 4.8,
        imageUrl: 'https://picsum.photos/id/2/400/300'),
    TouristSite(
        name: 'Musée d\'Art',
        description: 'Un musée contemporain avec des expositions uniques',
        distance: '1.2 km',
        rating: 4.3,
        imageUrl: 'https://picsum.photos/id/3/400/300'),
    TouristSite(
        name: 'Monument Historique',
        description: 'Un monument emblématique de la région',
        distance: '4.5 km',
        rating: 4.7,
        imageUrl: 'https://picsum.photos/id/4/400/300'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is MapInitial || state is MapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoaded) {
            return Stack(
              children: [
                // Carte Google Maps
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    if (!_mapController.isCompleted) {
                      _mapController.complete(controller);
                    }
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
                ),

                // Bottom Sheet Personnalisé
                DraggableScrollableSheet(
                  initialChildSize: 0.3,
                  minChildSize: 0.15,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          // Indicateur de glissement
                          SliverToBoxAdapter(
                            child: Center(
                              child: Container(
                                width: 50,
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          // Titre de la section
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sites Touristiques Proches',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.filter_list, color: Colors.grey),
                                ],
                              ),
                            ),
                          ),

                          // Liste horizontale de sites
                          SliverToBoxAdapter(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 270),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _touristSites.length,
                                itemBuilder: (context, index) {
                                  return _buildHorizontalTouristSiteCard(
                                      _touristSites[index]);
                                },
                              ),
                            ),
                          ),

                          // Liste verticale complète
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return _buildVerticalTouristSiteCard(
                                    _touristSites[index]);
                              },
                              childCount: _touristSites.length,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is MapError) {
            return Center(
              child: Text('Erreur : ${state.message}'),
            );
          }
          return const Center(child: Text('État inconnu'));
        },
      ),
    );
  }

  // Carte horizontale pour la liste déroulante
  Widget _buildHorizontalTouristSiteCard(TouristSite site) {
    return Container(
      width: 250,
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image du site
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                site.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),

            // Détails du site
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    site.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    site.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.blue),
                          Text(site.distance),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Text('${site.rating}'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Carte verticale pour la liste complète
  Widget _buildVerticalTouristSiteCard(TouristSite site) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            site.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: Icon(Icons.image_not_supported),
              );
            },
          ),
        ),
        title: Text(
          site.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(site.description,
                maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                Text(site.distance),
                const Spacer(),
                const Icon(Icons.star, size: 16, color: Colors.amber),
                Text('${site.rating}')
              ],
            )
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.directions, color: Colors.blue),
          onPressed: () {
            // Logique pour obtenir des directions
          },
        ),
      ),
    );
  }
}

// Classe pour représenter un site touristique
class TouristSite {
  final String name;
  final String description;
  final String distance;
  final double rating;
  final String imageUrl;

  TouristSite({
    required this.name,
    required this.description,
    required this.distance,
    required this.rating,
    required this.imageUrl,
  });
}
