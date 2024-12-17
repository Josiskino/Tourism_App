import 'package:flutter/material.dart';

import '../features/home_page/domain/entities/category.dart';

class PlaceCategory {
  final IconData icon;
  final String name;

  PlaceCategory({required this.icon, required this.name});
}

PlaceCategory _convertToPlaceCategory(Category category) {
  return PlaceCategory(
      icon: _mapCategoryToIcon(category.name), name: category.name);
}

IconData _mapCategoryToIcon(String categoryName) {
  switch (categoryName.toLowerCase()) {
    case 'parcs':
      return Icons.park_outlined;
    case 'hôtels':
      return Icons.hotel_outlined;
    case 'musées':
      return Icons.museum_outlined;
    case 'plages':
      return Icons.beach_access_outlined;
    case 'clubs':
      return Icons.nightlife_outlined;
    case 'cafés':
      return Icons.coffee_outlined;
    default:
      return Icons.category_outlined;
  }
}