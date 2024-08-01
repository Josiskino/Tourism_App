import 'package:myapp/features/auth/domain/entities/user.dart';

class UserModel extends User {

  const UserModel({
    required super.id,
    required super.email,
    required super.role, 
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
      'token': token,
    };
  }
  
}
