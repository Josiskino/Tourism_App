import 'package:flutter/material.dart';
import '../core/constants/image_strings.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3, // Nombre de sections (onglets)
        child: Stack(
          children: [
            // La colonne principale
            Column(
              children: [
                // L'image en haut
                const Image(
                  image: AssetImage(tTripScreenImage1),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                const SizedBox(height: 30),
                const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  automaticIndicatorColorAdjustment: false,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: 'Overview'),
                    Tab(text: 'Itinerary'),
                    Tab(text: 'Explore'),
                  ],
                ),
                // Le contenu des onglets
                Expanded(
                  child: TabBarView(
                    children: [
                      // Contenu de chaque section
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 18),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Reservation and attachements",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    width: 50,
                                    height: 40,
                                    child: const Column(
                                      children: [Icon(Icons.camera_alt)],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    width: 1,
                                    child: VerticalDivider(
                                      color: Color.fromARGB(255, 29, 27, 27),
                                      thickness: 1,
                                      indent: 2,
                                      endIndent: 11,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    width: 50,
                                    height: 40,
                                    child: const Column(
                                      children: [Icon(Icons.hotel_rounded,)],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    width: 1,
                                    child: VerticalDivider(
                                      color: Color.fromARGB(255, 29, 27, 27),
                                      thickness: 1,
                                      indent: 2,
                                      endIndent: 11,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    width: 50,
                                    height: 40,
                                    child: const Column(
                                      children: [Icon(Icons.directions_car)],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    width: 1,
                                    child: VerticalDivider(
                                      color: Color.fromARGB(255, 29, 27, 27),
                                      thickness: 1,
                                      indent: 2,
                                      endIndent: 11,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    width: 50,
                                    height: 40,
                                    child: const Column(
                                      children: [Icon(Icons.restaurant_menu)],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    width: 1,
                                    child: VerticalDivider(
                                      color: Color.fromARGB(255, 29, 27, 27),
                                      thickness: 1,
                                      indent: 2,
                                      endIndent: 11,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    width: 50,
                                    height: 40,
                                    child: const Column(
                                      children: [Icon(Icons.more_horiz)],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 7,
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down),
                                      SizedBox(width: 10),
                                      Text(
                                        "Notes",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Text(
                                    "white or paste anything here - how to get around, tips and triks, etc.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(207, 138, 138, 138),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 7,
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down),
                                      SizedBox(width: 10),
                                      Text(
                                        "Places to visit",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Text(
                                    "white or paste anything here - how to get around, tips and triks, etc.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(207, 138, 138, 138),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 7,
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down),
                                      SizedBox(width: 10),
                                      Text(
                                        "Places to visit",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Text(
                                    "white or paste anything here - how to get around, tips and triks, etc.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(207, 138, 138, 138),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                        
                        
                          ],
                        ),
                      ),
                      const Center(child: Text('Contenu de la section 2')),
                      const Center(child: Text('Contenu de la section 3')),
                    ],
                  ),
                ),
              ],
            ),
            // Le widget à superposer
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Kpalimé trip with friends',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(232, 19, 18, 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 17,
                            color: Color.fromARGB(255, 138, 138, 138),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "3/10/2023 - 4/10/2023",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 138, 138, 138),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              // top: 120,
              bottom: 30,
              right: 20,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(206, 32, 32, 32),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.map_outlined,
                    color: Colors.grey.shade300,
                    size: 28,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 125),
                  Row(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: Colors.grey.shade300,
                        size: 20,
                      ),
                      
                      Text(
                        "change header image",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 14,
                        ),
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
}
