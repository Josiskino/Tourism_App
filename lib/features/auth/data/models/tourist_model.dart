import 'package:myapp/features/auth/domain/entities/tourist.dart';

class TouristModel extends Tourist {

  TouristModel({
    required super.id,
    required super.userId,
    required super.touristName,
  });

  factory TouristModel.fromJson(Map<String, dynamic> json) {
    return TouristModel(
      id: json['id'],
      userId: json['user_id'],
      touristName: json['touristName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'touristName': touristName,
    };
  }

}
