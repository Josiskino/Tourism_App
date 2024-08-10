import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/core/util/screen_size.dart';

class ActivitySearchBar extends StatelessWidget {
  const ActivitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    
    final SearchSectionContainerHight = SizeUtil.heightPercentage(6);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          //margin: EdgeInsets.only(right: screenWight * 0.9),
          height: SearchSectionContainerHight,
          width: SizeUtil.widthPercentage(70),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(
                vertical: SearchSectionContainerHight * 0.23,
              ),
            ),
          ),
        ),
        Container(
          height: SearchSectionContainerHight,
          width: SizeUtil.widthPercentage(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeUtil.spacing(1.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Iconsax.filter,
                  color: Color(0xFFFFFFA1),
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    color: const Color(0xFFFFFFA1),
                    fontSize: SizeUtil.textSize(4.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
