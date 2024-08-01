import 'package:flutter/material.dart';
import 'package:myapp/entities/categories.dart';
import 'package:myapp/entities/sites.dart';
import 'package:myapp/main_screen/details_site.dart';
import 'package:myapp/main_screen/widgets/home_screen_body_image.dart';

class HomeScreenBodySection extends StatelessWidget {
  HomeScreenBodySection({super.key});

  final List<Categories> categories = Categories.categories();
  final List<Sites> sites = Sites.sites();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 700,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const HomeScreenBodyImage(),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Explore Places',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(220, 220, 219, 1),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: Categories.categories().length,
                  ),
                ),
                SizedBox(
                  height: 300,
                  //color: Colors.amberAccent,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsSite(sites[index]),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                              //color: Colors.blue,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Hero(
                                    tag: sites[index].name,
                                    child: Image.asset(
                                      sites[index].image,
                                      //fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Text(
                                  sites[index].name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: Sites.sites().length,
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
