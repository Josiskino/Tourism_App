import 'package:flutter/material.dart';
import 'package:myapp/entities/trip.dart';

class TripDetailScreen extends StatelessWidget {
  final TripInfo trip;

  const TripDetailScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Contenu défilable
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1, // Espace pour le bouton
              ),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 250.0,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        trip.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Titre du trip
                        Text(
                          trip.name,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        // Localisation
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 8),
                            Text(trip.startLocation),
                          ],
                        ),
                        
                        // Note et Prix
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text(trip.rating.toString()),
                              ],
                            ),
                            Text(
                              '\$${trip.pricePerPerson.toInt()}/personne', 
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        
                        // Description
                        SizedBox(height: 16),
                        Text(
                          'Description du voyage', // Ajoutez cette propriété à TripInfo
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        
                        // Espace supplémentaire au bas pour ne pas masquer le bouton
                        SizedBox(height: 100),
                      ]),
                    ),
                  ),
                ],
              ),
            ),

            // Bouton Participer/Réserver placé en bas
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    _showBookingDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Participer au voyage',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Réserver ce voyage'),
          content: Text('Voulez-vous vraiment participer à ce voyage ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Voyage réservé avec succès !')),
                );
              },
              child: Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }
}