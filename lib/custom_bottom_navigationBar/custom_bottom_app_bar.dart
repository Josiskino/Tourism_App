import 'package:flutter/material.dart';
import 'package:myapp/core/constants/colors.dart';

class CustomBottomAppBar extends StatelessWidget {

  final Color selectedColor;
  final Color unSelectedColor;
  final Function(int index) onTap;
  final List<CustomBottomAppBarItem> children;
  final int selectedTab;

  const CustomBottomAppBar({
    super.key, 
    required this.selectedColor, 
    required this.unSelectedColor, 
    required this.onTap, 
    required this.children,
     required this.selectedTab
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(children.length, (index) {
            return CustomBottomAppBarItem(
                icon: children[index].icon,
                text: children[index].text,
                color: selectedTab == index ? selectedColor : unSelectedColor,
                press: () {
                  onTap(index);
                });
          }),
        ),
      ),
    );
  }
}

class CustomBottomAppBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? press;
  final Color? color;
  const CustomBottomAppBarItem({
    super.key,
    required this.icon,
    required this.text,
    this.press,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kprimaryColor,
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: color == kprimaryColor ? kprimaryColor : Colors.grey.shade300,
        ),
      ),
    );
  }
}
