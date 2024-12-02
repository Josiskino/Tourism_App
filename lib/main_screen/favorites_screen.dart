import 'package:flutter/material.dart';
import 'package:myapp/core/util/screen_size.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<dynamic> _favoriteTrips = []; 
  final List<dynamic> _favoriteTouristSites = []; 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  // Widget pour afficher un état vide
  Widget _buildEmptyState({
    required String title, 
    required String message, 
    required IconData icon
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon, 
            size: 100, 
            color: Colors.grey[300]
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: SizeUtil.textSize(5),
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              fontSize: SizeUtil.textSize(3.5),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Widget pour afficher la liste des trips favoris
  Widget _buildFavoriteTrips() {
    if (_favoriteTrips.isEmpty) {
      return _buildEmptyState(
        title: 'No Favorite Trips',
        message: 'You have not added any trips to your favorites yet.',
        icon: Icons.travel_explore,
      );
    }

    return ListView.builder(
      itemCount: _favoriteTrips.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_favoriteTrips[index].name),
        );
      },
    );
  }

  // Widget pour afficher la liste des sites touristiques favoris
  Widget _buildFavoriteTouristSites() {
    if (_favoriteTouristSites.isEmpty) {
      return _buildEmptyState(
        title: 'No Favorite Tourist Sites',
        message: 'You have not saved any tourist sites to your favorites yet.',
        icon: Icons.location_city,
      );
    }

    return ListView.builder(
      itemCount: _favoriteTouristSites.length,
      itemBuilder: (context, index) {
        // Créez votre widget de site touristique favori ici
        return ListTile(
          title: Text(_favoriteTouristSites[index].name),
          // Autres détails du site
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'My Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: SizeUtil.textSize(7.2),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(192, 248, 246, 246),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 0.5,
          indicatorColor: const Color(0xFFFF6600),
          labelColor: const Color(0xFFFF6600),
          labelStyle: TextStyle(
            fontSize: SizeUtil.textSize(4.5),
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(text: 'Trips'),
            Tab(text: 'Tourist Sites'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Trips Tab
          _buildFavoriteTrips(),
          
          // Tourist Sites Tab
          _buildFavoriteTouristSites(),
        ],
      ),
    );
  }
}