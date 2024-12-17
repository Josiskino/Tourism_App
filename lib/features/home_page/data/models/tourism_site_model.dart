import '../../domain/entities/tourism_site.dart';
import 'photo_model.dart';

class TourismSiteModel extends TourismSite {
  TourismSiteModel({
    required super.id,
    required super.name,
    required super.city,
    required super.description,
    required super.enterPrice,
    super.website,
    super.phoneNumber,
    required super.latitude,
    required super.longitude,
    required super.status,
    required super.categoryId,
    super.rating,
    super.openingTime,
    super.closingTime,
    required List<PhotoModel> photos,
  }) : super(photos: photos);

  factory TourismSiteModel.fromJson(Map<String, dynamic> json) {
    var photosList = (json['photos'] as List)
        .map((photoJson) => PhotoModel.fromJson(photoJson))
        .toList();

    return TourismSiteModel(
      id: json['id'],
      name: json['tourismeSiteName'],
      city: json['tourismeSiteCity'],
      description: json['tourismeSiteDescription'],
      enterPrice: json['tourismeSiteEnterPrice'],
      website: json['tourismeSiteWebSite'],
      phoneNumber: json['tourismeSitePhoneNumber'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      status: json['status'],
      categoryId: json['tourism_category_id'],
      rating: json['rating'] != null ? double.parse(json['rating']) : null,
      openingTime: json['opening_time'],
      closingTime: json['closing_time'],
      photos: photosList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tourismeSiteName': name,
      'tourismeSiteCity': city,
      'tourismeSiteDescription': description,
      'tourismeSiteEnterPrice': enterPrice,
      'tourismeSiteWebSite': website,
      'tourismeSitePhoneNumber': phoneNumber,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'status': status,
      'tourism_category_id': categoryId,
      'rating': rating?.toString(),
      'opening_time': openingTime,
      'closing_time': closingTime,
      'photos': photos.map((photo) => (photo as PhotoModel).toJson()).toList(),
    };
  }
}
