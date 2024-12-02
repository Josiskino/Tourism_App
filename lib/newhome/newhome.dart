import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/category_select_screen/category_select.dart';
import 'package:myapp/core/constants/text_strings.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/entities/trip.dart';
import 'package:myapp/trip_detail_screen/trip_detail_screen.dart';

import '../config/theme/color_schemes.dart';
import '../core/constants/sizes.dart';
import '../core/util/custom_snackbar.dart';
import '../entities/sites.dart';
import '../place_details_screen/place_details_screen.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  final List<String> _imageUrls = [
    'https://via.placeholder.com/600x300?text=Image+1',
    'https://via.placeholder.com/600x300?text=Image+2',
    'https://via.placeholder.com/600x300?text=Image+3',
    'https://via.placeholder.com/600x300?text=Image+4',
    'https://via.placeholder.com/600x300?text=Image+5',
  ];

  // final List<String> _imagesAsset = [
  //   '',
  //   '',
  //   '',
  // ];

  final List<Sites> sites = Sites.sites();

  PlaceCategory? _selectedCategory;

  final List<PlaceCategory> _categories = [
    PlaceCategory(icon: Icons.park_outlined, name: 'Parcs'),
    PlaceCategory(icon: Icons.hotel_outlined, name: 'Hôtels'),
    PlaceCategory(icon: Icons.museum_outlined, name: 'Musées'),
    PlaceCategory(icon: Icons.beach_access_outlined, name: 'Plages'),
    PlaceCategory(icon: Icons.nightlife_outlined, name: 'Clubs'),
    PlaceCategory(icon: Icons.coffee_outlined, name: 'Cafés'),
    // PlaceCategory(icon: Icons.local_florist, name: 'Jardins'),
    // PlaceCategory(icon: Icons.restaurant, name: 'Restaurants'),
    // PlaceCategory(icon: Icons.shopping_bag, name: 'Boutiques'),
  ];

  int _currentIndex = 0;

  // Set pour garder trace des sites favoris
  final Set<int> _favorites = {};

  // Méthode pour basculer l'état favori
  void _toggleFavorite(int index) {
    setState(() {
      if (_favorites.contains(index)) {
        _favorites.remove(index);
        showCustomSnackBar(
            context, 'Removed ${sites[index].name} from favorites');
      } else {
        _favorites.add(index);
        showCustomSnackBar(context, 'Added ${sites[index].name} to favorites');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildSearchBar(context),
              const SizedBox(height: sectionSpace),
              _buildImageCarousel(),
              const SizedBox(height: sectionSpace),
              _buildCategorySectionTitle('Personal Suggestion', context),
              const SizedBox(height: titleSpace),
              _buildCategoriesList(),
              const SizedBox(height: sectionSpace),
              _buildPlacesHeader(context),
              const SizedBox(height: titleSpace),
              _buildNearbyPlacesList(),
              const SizedBox(height: sectionSpace),
              _buildTripsSectionTitle('Popular Trips', context),
              const SizedBox(height: titleSpace),
              _buildTripsList(),
              const SizedBox(height: sectionSpace),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: TextStyle(
              color: AppColors.subTextColorLight,
              fontSize: SizeUtil.textSize(3),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.location_on, size: SizeUtil.textSize(4.5)),
              const SizedBox(width: 2),
              Text(
                'New York, USA',
                style: TextStyle(fontSize: SizeUtil.textSize(3.4)),
              ),
              Icon(Icons.arrow_drop_down, size: SizeUtil.textSize(6)),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_outlined,
            size: SizeUtil.textSize(6),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              height: SizeUtil.heightPercentage(7),
              decoration: BoxDecoration(
                color: const Color.fromARGB(122, 223, 219, 217),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  tSearchBarText,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 156, 150, 150),
                    fontSize: SizeUtil.textSize(3.6),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 1,
            child: Container(
              height: SizeUtil.heightPercentage(7),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  size: SizeUtil.textSize(6),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        children: [
          CarouselSlider(
            items: _imageUrls.map((url) => _buildCarouselItem(url)).toList(),
            options: CarouselOptions(
              height: SizeUtil.heightPercentage(20),
              enlargeCenterPage: true,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              onPageChanged: (index, _) =>
                  setState(() => _currentIndex = index),
            ),
          ),
          const SizedBox(height: 10),
          _buildCarouselIndicators(),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Icon(Icons.error),
          );
        },
      ),
    );
  }

  Widget _buildCarouselIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _imageUrls.asMap().entries.map((entry) {
        final isSelected = _currentIndex == entry.key;
        return GestureDetector(
          onTap: () => setState(() => _currentIndex = entry.key),
          child: Container(
            width: isSelected
                ? 16.0
                : 7.0, // Largeur augmentée pour l'indicateur actif
            height: isSelected
                ? 4.0
                : 7.0, // Hauteur réduite pour l'indicateur actif
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: isSelected
                  ? BorderRadius.circular(2.0)
                  : BorderRadius.circular(50.0),
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategorySectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Text(
        title,
        style: TextStyle(
          fontSize: SizeUtil.textSize(5.6),
          color: const Color(0xFF444648),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCategoriesList() {
    return SizedBox(
      height: SizeUtil.heightPercentage(12.6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryItem(_categories[index], context);
        },
      ),
    );
  }

  Widget _buildCategoryItem(PlaceCategory category, BuildContext context) {
    // Déterminer si cette catégorie est sélectionnée
    bool isSelected = _selectedCategory == category;

    return GestureDetector(
      onTap: () {
        setState(() {
          // Si la catégorie cliquée est déjà sélectionnée, la désélectionner
          _selectedCategory = _selectedCategory == category ? null : category;
        });

        Future.delayed(const Duration(milliseconds: 100), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategorySelectScreen(
                selectedCategory: category,
                allSites: Sites.sites(),
              ),
            ),
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: isSelected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Colors.grey
                      .shade200, // Couleur différente quand non sélectionné
              child: Icon(
                category.icon,
                size: 21,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Colors
                        .grey, // Couleur d'icône différente quand non sélectionné
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 11,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey, // Couleur de texte différente
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlacesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Places near you',
            style: TextStyle(
              fontSize: SizeUtil.textSize(5),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF444648),
            ),
          ),
          Text(
            'All Places',
            style: TextStyle(
              fontSize: SizeUtil.textSize(3.6),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  // --- NEARBY PLACES LIST ---
  Widget _buildNearbyPlacesList() {
    return SizedBox(
      height: SizeUtil.heightPercentage(41.8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: appPadding),
        //itemCount: _imageUrls.length,
        itemCount: sites.length,
        separatorBuilder: (_, __) => const SizedBox(width: 13),
        itemBuilder: (context, index) => _buildPlaceCard(index, context),
      ),
    );
  }

  Widget _buildPlaceCard(int index, BuildContext context) {
    return SizedBox(
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPlaceImage(index),
          const SizedBox(height: 2),
          _buildPlaceInfo(index, context),
        ],
      ),
    );
  }

  Widget _buildPlaceImage(int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 800),
              reverseTransitionDuration: const Duration(milliseconds: 800),
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: PlaceDetailsScreen(site: sites[index]),
                );
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return Container(
                  color: Colors.transparent, // Ensure transparent background
                  child: child,
                );
              },
            ),
          ),
          onDoubleTap: () => _toggleFavorite(index),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Hero(
                tag: sites[index].name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    sites[index].image,
                    height: 200,
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (_favorites.contains(index))
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutBack,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 2 * (1 + 0.2 * sin(value * pi)),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white.withOpacity(1 - value),
                        size: 40,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: _buildFavoriteButton(index),
        ),
      ],
    );
  }

  Widget _buildFavoriteButton(int index) {
    final bool isFavorite = _favorites.contains(index);
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.white.withOpacity(0.8),
      child: IconButton(
        onPressed: () => _toggleFavorite(index),
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 13,
        ),
      ),
    );
  }

  Widget _buildPlaceInfo(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //'Nom de la place ${index + 1}',
            sites[index].name,
            style: TextStyle(
              fontSize: SizeUtil.textSize(3.9),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          //const SizedBox(height: 2),
          Text(
            //'Lieu de la place',
            sites[index].localisation,
            style: TextStyle(
              fontSize: SizeUtil.textSize(3.5),
              color: AppColors.subTextColorLight,
            ),
          ),
          //const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.secondary,
                    size: SizeUtil.iconSize(3.5),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    //'4.${index + 1}',
                    sites[index].rating.toString(),
                    style: TextStyle(
                      fontSize: SizeUtil.textSize(3.1),
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      //text: '\$${(index + 1) * 10}',
                      text: 'XOF ${sites[index].price}',
                      style: TextStyle(
                        fontSize: SizeUtil.textSize(2.9),
                        color: AppColors.textColorLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '/person',
                      style: TextStyle(
                        fontSize: SizeUtil.textSize(3.1),
                        color: AppColors.subTextColorLight,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceCategory {
  final IconData icon;
  final String name;

  PlaceCategory({required this.icon, required this.name});
}

Widget _buildTripsSectionTitle(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: appPadding),
    child: Text(
      title,
      style: TextStyle(
        fontSize: SizeUtil.textSize(4.6),
        color: const Color(0xFF444648),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildTripsList() {
  final List<TripInfo> myTrips = TripInfo.trips;
  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: appPadding),
    itemCount: myTrips.length,
    separatorBuilder: (context, index) => const SizedBox(height: 13),
    itemBuilder: (context, index) => _buildTripCard(myTrips[index], context),
  );
}

Widget _buildTripCard(TripInfo trip, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
           builder: (context) => TripDetailScreen(trip: trip),
        ),
      );
    },
    child: Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image du trip
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: Image.network(
              trip.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                );
              },
            ),
          ),
    
          // Informations du trip
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nom du trip
                  Text(
                    trip.name,
                    style: TextStyle(
                      fontSize: SizeUtil.textSize(3.5),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(height: 3),
                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: SizeUtil.iconSize(3.8),
                        color: AppColors.subTextColorLight,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        trip.startLocation,
                        style: TextStyle(
                          fontSize: SizeUtil.textSize(3.3),
                          color: AppColors.subTextColorLight,
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 10),
                  const Spacer(),
                  // Rating et Prix
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Rating
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: SizeUtil.iconSize(3.5),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            trip.rating.toString(),
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.2),
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
    
                      // Prix
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$',
                              style: TextStyle(
                                fontSize: SizeUtil.textSize(3.2),
                                color: AppColors.textColorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${trip.pricePerPerson.toInt()}',
                              style: TextStyle(
                                fontSize: SizeUtil.textSize(3.2),
                                color: AppColors.textColorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '/person',
                              style: TextStyle(
                                fontSize: SizeUtil.textSize(3.2),
                                color: AppColors.subTextColorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
