import 'package:flutter/material.dart';
import 'package:myapp/booking_screen/booking_screen.dart';
//import 'package:myapp/config/theme/color_schemes.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/entities/sites.dart';
import 'package:readmore/readmore.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final Sites site;

  const PlaceDetailsScreen({super.key, required this.site});

  @override
  PlaceDetailsScreenState createState() => PlaceDetailsScreenState();
}

class PlaceDetailsScreenState extends State<PlaceDetailsScreen>
    with SingleTickerProviderStateMixin {
  late String currentMainImage;
  late List<String> displayedImages;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    currentMainImage = widget.site.image;
    displayedImages = [
      widget.site.image,
      'assets/images/site1_2.jpg',
      'assets/images/site1_3.jpg',
      'assets/images/site1_4.jpg',
      'assets/images/site1_5.jpg',
      'assets/images/site1_6.jpg',
      'assets/images/site1_7.jpg',
      'assets/images/site1_8.jpg',
      'assets/images/site1_9.jpg',
    ];
    _tabController = TabController(length: 3, vsync: this);
    
  }

  void swapImages(String newMainImage) {
    setState(() {
      int currentMainIndex = displayedImages.indexOf(currentMainImage);
      int newMainIndex = displayedImages.indexOf(newMainImage);
      String temp = displayedImages[currentMainIndex];
      displayedImages[currentMainIndex] = displayedImages[newMainIndex];
      displayedImages[newMainIndex] = temp;
      currentMainImage = newMainImage;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildSecondaryImagesColumn() {
    const int visibleImages = 3;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      right: 16,
      // Ajustement de la position pour éviter la collision avec l'image principale
      top: screenHeight * 0.02, // Réduit de 0.22 à 0.08 pour remonter le bloc
      child: Container(
        padding: EdgeInsets.only(
          top: screenHeight * 0.02,
          bottom: screenHeight * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container "+8" en premier
            if (displayedImages.length > visibleImages + 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    _showGalleryDialog(context);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.collections,
                          color: Colors.white.withOpacity(0.7),
                          size: 24,
                        ),
                        Positioned(
                          bottom: 8,
                          child: Text(
                            '+${displayedImages.length - (visibleImages + 1)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Images secondaires avec espacement ajusté
            ...List.generate(
              visibleImages,
              (index) => Padding(
                padding: const EdgeInsets.only(
                    bottom: 15), // Augmenté légèrement l'espacement
                child: GestureDetector(
                  onTap: () {
                    if (index < displayedImages.length) {
                      String imageToShow = displayedImages[index + 1];
                      swapImages(imageToShow);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            displayedImages[index + 1],
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        if (displayedImages[index + 1] == currentMainImage)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                      ],
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

// Fonction pour afficher la galerie complète
  void _showGalleryDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: displayedImages.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    swapImages(displayedImages[index]);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      displayedImages[index],
                      fit: BoxFit.cover,
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

  Widget _buttonNavigationBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 60,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            width: 150,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   border: Border.all(
            //     color: const Color(0xFFFF983F),
            //     width: 1,
            //   ),
            // ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "XOF ${widget.site.price.isNotEmpty ? widget.site.price : "FREE"}",
                    style: TextStyle(
                      color: const Color(0xFF1D1F21),
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtil.textSize(4.2),
                    ),
                  ),
                  Text(
                    "Perperson",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: SizeUtil.textSize(3.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              color: const Color(0xFFFF983F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(site: widget.site),
                  ),
                );
              },
              child: Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                    color: const Color(0xFFFFFFA1),
                    fontSize: SizeUtil.textSize(3.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        bottomNavigationBar: _buttonNavigationBar(context),
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.53,
                pinned: true,
                stretch: true,
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 13),
                  child: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black87,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Hero(
                          tag: widget.site.name,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: Container(
                              key: ValueKey<String>(currentMainImage),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(currentMainImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Gradient overlay avec les mêmes bordures arrondies
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 150, //Hauteur de la barre de gradient
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                          ),
                        ),
                        _buildSecondaryImagesColumn(),
                      ],
                    ),
                  ),
                ),
              ),
              // Le reste du contenu reste inchangé...
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.site.name,
                                style: TextStyle(
                                  fontSize: SizeUtil.textSize(5.9),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                size: SizeUtil.iconSize(4.5),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.site.rating,
                                style: TextStyle(
                                  fontSize: SizeUtil.textSize(3.8),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              // Location section
                              Icon(
                                Icons.location_on,
                                size: SizeUtil.iconSize(3.8),
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.site.localisation,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: SizeUtil.textSize(3.8),
                                ),
                              ),
                              const Spacer(),
                              // Vertical divider
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 67),
                                child: Container(
                                  height: 15,
                                  width: 1,
                                  color: Colors.grey[300],
                                ),
                              ),

                              // Opening hours section
                              Icon(
                                Icons.access_time,
                                size: SizeUtil.iconSize(4.2),
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${widget.site.openingTime} - ${widget.site.closingTime}",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: SizeUtil.textSize(3.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(4.9),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10), // A ajuster après
                          ReadMoreText(
                            widget.site.description,
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.8),
                              height: 1.3,
                              color: Colors.grey,
                            ),
                            trimMode: TrimMode.Line,
                            trimLines: 3,
                            colorClickableText: const Color(0xFFFF983F),
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1D1F21),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
