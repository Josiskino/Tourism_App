import 'package:myapp/features/auth/domain/entities/tourist.dart';

class TouristModel extends Tourist {
  const TouristModel({
    required super.id,
    required super.email,
    required super.role,
    required super.touristName,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TouristModel.fromJson(Map<String, dynamic> json) {
    return TouristModel(
      id: json['id'] as int,
      email: json['email'] as String,
      role: json['role'] as String,
      touristName: json['touristName'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
      'touristName': touristName,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
