import 'package:flutter/material.dart';

class HomeScreenLocalisation extends StatelessWidget {
  const HomeScreenLocalisation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your location",
          style: TextStyle(
            //color: Color(0xFF898989),
            color: Color(0xFFFF983F),
            fontSize: 17,
          ),
        ),
        Text(
          "Lomé, Agoè",
          style: TextStyle(
            //color: Color(0xFFF6F6F6),
            color: Color(0xFFFFFFA1),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
