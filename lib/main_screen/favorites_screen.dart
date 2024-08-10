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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              'My Favorites',
              style: TextStyle(
                color: const Color(0xFF000000),
                fontWeight: FontWeight.bold,
                fontSize: SizeUtil.textSize(7.2),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(192, 248, 246, 246),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFFF6600),
          labelColor: const Color(0xFFFF6600),
          labelStyle: TextStyle(
            fontSize: SizeUtil.textSize(4.5),
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              text: 'Events',
              //icon: Icon(Icons.event),
            ),
            Tab(text: 'Organizers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Events Tab
          const Center(
            child: Text('No followed events'),
          ),
          // Organizers Tab
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://via.placeholder.com/150', // Remplacez par votre URL d'image ou par une image locale
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'No followed organizers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
