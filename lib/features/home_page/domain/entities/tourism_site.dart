import 'photo.dart';

class TourismSite {
  final int id;
  final String name;
  final String city;
  final String description;
  final int enterPrice;
  final String? website;
  final String? phoneNumber;
  final double latitude;
  final double longitude;
  final int status;
  final int categoryId;
  final double? rating; 
  final String? openingTime; 
  final String? closingTime; 
  final List<Photo> photos;

  TourismSite({
    required this.id,
    required this.name,
    required this.city,
    required this.description,
    required this.enterPrice,
    this.website,
    this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.categoryId,
    this.rating,
    this.openingTime,
    this.closingTime,
    required this.photos,
  });
}
