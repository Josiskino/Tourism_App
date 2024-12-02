import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/entities/sites.dart';
import 'package:myapp/newhome/newhome.dart';

class CategorySelectScreen extends StatelessWidget {
  final PlaceCategory selectedCategory;
  final List<Sites> allSites;

  const CategorySelectScreen({
    super.key, 
    required this.selectedCategory, 
    required this.allSites
  });

  @override
  Widget build(BuildContext context) {
    // Filtrer les sites par catégorie
    final categorySites = allSites
        .where((site) => _matchCategory(site, selectedCategory))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CupertinoNavigationBarBackButton(
          color: Theme.of(context).colorScheme.primary,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: categorySites.isEmpty 
        ? _buildEmptyState(context)
        : _buildSitesList(context, categorySites),
    );
  }

  Widget _buildSitesList(BuildContext context, List<Sites> sites) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: sites.length,
      itemBuilder: (context, index) {
        final site = sites[index];
        return _buildSiteCard(context, site);
      },
    );
  }

  Widget _buildSiteCard(BuildContext context, Sites site) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
            child: Image.asset(
              site.image,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  site.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      site.localisation,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoChip(
                      context, 
                      Icons.star_rate, 
                      site.rating
                    ),
                    _buildInfoChip(
                      context, 
                      Icons.attach_money, 
                      '${site.price} XOF'
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon, 
            size: 16, 
            color: Theme.of(context).colorScheme.primary
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.not_interested,
            size: 80,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun site trouvé',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Il n\'y a pas de sites dans cette catégorie',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  // À implémenter selon votre logique de catégorisation
  bool _matchCategory(Sites site, PlaceCategory category) {
    // Exemple de logique, à adapter selon vos besoins
    return true; // Remplacer par votre logique de filtrage
  }
}