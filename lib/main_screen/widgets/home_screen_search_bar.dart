import 'package:flutter/material.dart';

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.search,
          //color: Color(0xFFCFCFCF),
          //color: Color(0xFFFF6600),
          color: Color(0xFF444648),

        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Rechercher",
          style: TextStyle(
            //color: Color(0xFFCFCFCF),
            //color: Color(0xFFFF6600),
            color: Color(0xFF444648),

            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
