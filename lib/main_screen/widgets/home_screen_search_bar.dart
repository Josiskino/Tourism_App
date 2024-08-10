import 'package:flutter/material.dart';
import 'package:myapp/core/constants/text_strings.dart';
import 'package:myapp/core/util/screen_size.dart';

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Icon(
          Icons.location_on_outlined,
          //color: Color(0xFFCFCFCF),
          //color: Theme.of(context).colorScheme.primary,
          color: const Color(0xFF444648),
          size: SizeUtil.iconSize(7),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          tSearchBarText,
          style: TextStyle(
            //color: Color(0xFFCFCFCF),
            //color: Theme.of(context).colorScheme.primary,
            color: const Color(0xFF444648),
            fontSize: SizeUtil.textSize(4.5),
          ),
        ),
      ],
    );
  }
}
