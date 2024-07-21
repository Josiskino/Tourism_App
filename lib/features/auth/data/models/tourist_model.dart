import 'package:myapp/features/auth/data/models/user_model.dart';
import 'package:myapp/features/auth/domain/entities/tourist.dart';

class TouristModel extends Tourist {

  const TouristModel({
    required super.id,
    required super.user,
    required super.touristName,
  });

  factory TouristModel.fromJson(Map<String, dynamic> json) {

    return TouristModel(
      id: json['id'] ?? '',
      user: UserModel.fromJson(json['user'] ?? ''),
      touristName: json['touristName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'touristName': touristName,
      'email': user.email,
      'role': user.role,
    };
  }

}
