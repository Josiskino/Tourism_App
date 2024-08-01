import 'package:flutter/material.dart';
import 'package:myapp/main_screen/widgets/home_screen_localisation.dart';
import 'package:myapp/main_screen/widgets/home_screen_search_bar.dart';

class HomeScreenHeaderSection extends StatelessWidget {
  const HomeScreenHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const HomeScreenLocalisation(),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF2E2E2E),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: const Center(
                child: Icon(
                  Icons.menu,
                  color: Color(0xFFFF6600),
                  size: 24.0,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF2E2E2E),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: const Center(
                child: Icon(
                  Icons.notifications,
                  color: Color(0xFFFF6600),
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 25),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF2E2E2E),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const HomeScreenSearchBar(),          
            ),
        ),
      ],
    );
  }
}
