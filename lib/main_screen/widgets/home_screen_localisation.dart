import 'package:flutter/material.dart';
import 'package:myapp/core/constants/text_strings.dart';
import 'package:myapp/core/util/screen_size.dart';

class HomeScreenLocalisation extends StatelessWidget {
  const HomeScreenLocalisation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tLocationTitle,
          style: TextStyle(
            //color: Color(0xFF898989),
            color: const Color(0xFFFF983F),
            fontSize: SizeUtil.textSize(5.5),
          ),
        ),
         Text(
          tCurrentLocation,
          style: TextStyle(
            //color: Color(0xFFF6F6F6),
            color: Color(0xFFFFFFA1),
            fontSize: SizeUtil.textSize(6),
          ),
        ),
      ],
    );
  }
}
