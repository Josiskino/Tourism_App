import 'package:flutter/material.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/entities/sites.dart';

class DetailsSiteSliverDelegate extends SliverPersistentHeaderDelegate {
  final Sites sites;
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailsSiteSliverDelegate({
      required this.sites,
      required this.expandedHeight,
      required this.roundedContainerHeight,
    });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Hero(
          tag: sites.name,
          child: Image.asset(
            sites.image,
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(SizeUtil.spacing(2)),
                  margin: EdgeInsets.only(
                    top: SizeUtil.screenHeight * 0.06,
                    left: 15,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  padding: EdgeInsets.all(SizeUtil.spacing(2)),
                  margin: EdgeInsets.only(
                    top: SizeUtil.screenHeight * 0.06,
                    left: 15,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 5,
              color: const Color(0xFF4F4F4F),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

