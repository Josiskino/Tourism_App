import 'package:flutter/material.dart';

class HomeScreenBodyImage extends StatelessWidget {
  const HomeScreenBodyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          //color: Colors.deepOrange,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: [
            // Image widget that fills the container
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                'assets/images/cover/cover1.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                     Colors.transparent
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
            // Texts
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52,
                    width: 150,
                    child: Text(
                      'Découvrez des Lieux Magiques',
                      style: TextStyle(
                        color: Color(0xFFFFFFA1),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  SizedBox(
                    height: 60,
                    width: 210,
                    child: Text(
                      "Partez à l'aventure et créez des souvenirs inoubliables. L'évasion parfaite vous attend !",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
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
