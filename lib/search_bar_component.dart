import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: () {
          
        }, 
        icon: const Icon(
          Icons.search,
          size: 25,
          ),
        ),
       const Text(
        'Search',
        style: TextStyle(
          fontSize: 20
        ),
        ),
      ]
    );
  }
}