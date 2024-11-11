import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/constants/text_strings.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/entities/categories.dart';
import 'package:myapp/entities/sites.dart';
import 'package:myapp/main_screen/details_site.dart';
import 'package:myapp/main_screen/widgets/home_screen_body_image.dart';

import '../bloc/cubit/category_cubit.dart';

class HomeScreenBodySection extends StatelessWidget {
  HomeScreenBodySection({super.key});

  final List<Categories> categories = Categories.categories();
  final List<Sites> sites = Sites.sites();

  final homeScreenContainerHeight = SizeUtil.heightPercentage(46);
  final homeScreenContainerWidth = SizeUtil.widthPercentage(100);

  @override
  Widget build(BuildContext context) {
    final homeScreenCardHeight = homeScreenContainerHeight * 0.50;
    final homeScreenCardWidth = homeScreenContainerWidth * 0.65;

    final cardImageHeight = homeScreenCardHeight * 0.99;
    final cardImageWidth = homeScreenCardWidth * 0.99;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      tIndicativeCategoryText,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF444648),
                        fontWeight: FontWeight.bold,
                      ),
                      //textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Text(
                      'All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF444648),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 30,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    int currentIndex =
                        (state is CategorySelected) ? state.selectedIndex : -1;

                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        bool isSelected = index == currentIndex;

                        return GestureDetector(
                          onTap: () {
                            context.read<CategoryCubit>().selectCategory(index);
                          },
                          child: Container(
                            // constraints: const BoxConstraints(
                            //   maxWidth: 150,
                            // ),
                            //alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isSelected
                                  ? const Color(0xFFFF983F)
                                  : const Color(0xFFF5F5F5),
                              border: Border.all(
                                //color: const Color(0xFFFF983F),
                                color: isSelected
                                    ? const Color(0xFFFF983F)
                                    : const Color.fromARGB(255, 247, 244, 244),
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF444648),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: Categories.categories().length,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: homeScreenContainerHeight,
                width: homeScreenContainerWidth,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsSite(sites[index]),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: homeScreenCardHeight,
                      width: homeScreenCardWidth,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Color(0xFFF5F5F5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: cardImageHeight,
                                width: cardImageWidth,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Hero(
                                    tag: sites[index].name,
                                    child: Image.asset(
                                      sites[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: cardImageHeight,
                                width: cardImageWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.black.withOpacity(0.25),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.favorite_border, 
                                    color: Colors.white, 
                                    size: SizeUtil.textSize(6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sites[index].name,
                                  style: TextStyle(
                                    fontSize: SizeUtil.textSize(4.5),
                                    color: const Color(0xFF444648),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: const Color(0xFF444648),
                                      size: SizeUtil.textSize(5),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      sites[index].localisation,
                                      style: TextStyle(
                                        fontSize: SizeUtil.textSize(3.8),
                                        color: const Color(0xFF444648),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: const Color.fromARGB(
                                          255, 161, 160, 68),
                                      size: SizeUtil.textSize(5),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      sites[index].rating.toString(),
                                      style: TextStyle(
                                        fontSize: SizeUtil.textSize(3.8),
                                        color: const Color(0xFF444648),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: sites[index].price,
                                            style: TextStyle(
                                              fontSize: SizeUtil.textSize(3.8),
                                              color: const Color(0xFF444648),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' /Person',
                                            style: TextStyle(
                                              fontSize: SizeUtil.textSize(3.3),
                                              color: const Color(0xFF444648),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
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
        ],
      ),
    );
  } 
}
