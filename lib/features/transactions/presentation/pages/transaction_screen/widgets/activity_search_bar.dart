import 'package:flutter/material.dart';

class ActivitySearchBar extends StatelessWidget {
  const ActivitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search transactions...',
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}