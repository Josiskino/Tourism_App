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
          color: Color(0xFFCFCFCF),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Rechercher",
          style: TextStyle(
            color: Color(0xFFCFCFCF),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
