import '../../domain/entities/user.dart';

class UserModel extends User {
   String? token;

   UserModel({
    required super.id,
    required super.touristName,
    super.touristUserName,
    super.touristPhone,
    super.touristAddress,
    super.touristCity,
    super.touristCountry,
    super.touristPostalCode,
    super.touristPassport,
    super.touristPassportCountry,
    super.touristPassportDate,
    super.touristPassportNumber,
    super.touristPassportExpiry,
    super.touristPassportIssue,
    super.touristPassportPlace,
    super.touristPassportType,
    super.touristPassportImage,
    required super.status,
    required super.userId,
    required super.createdAt,
    required super.updatedAt,
    required super.email,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      id: json['user']['id'],
      email: json['user']['email'],
      touristName: json['user']['touristName'],
      touristUserName: json['user']['touristUserName'],
      touristPhone: json['user']['touristPhone'],
      touristAddress: json['user']['touristAddress'],
      touristCity: json['user']['touristCity'],
      touristCountry: json['user']['touristCountry'],
      touristPostalCode: json['user']['touristPostalCode'],
      touristPassport: json['user']['touristPassport'],
      touristPassportCountry: json['user']['touristPassportCountry'],
      touristPassportDate: json['user']['touristPassportDate'] != null
          ? DateTime.parse(json['user']['touristPassportDate'])
          : null,
      touristPassportNumber: json['user']['touristPassportNumber'],
      touristPassportExpiry: json['user']['touristPassportExpiry'] != null
          ? DateTime.parse(json['user']['touristPassportExpiry'])
          : null,
      touristPassportIssue: json['user']['touristPassportIssue'] != null
          ? DateTime.parse(json['user']['touristPassportIssue'])
          : null,
      touristPassportPlace: json['user']['touristPassportPlace'],
      touristPassportType: json['user']['touristPassportType'],
      touristPassportImage: json['user']['touristPassportImage'],
      status: json['user']['status'],
      userId: json['user']['user_id'],
      createdAt: DateTime.parse(json['user']['created_at']),
      updatedAt: DateTime.parse(json['user']['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': {
        'id': id,
        'touristName': touristName,
        'touristUserName': touristUserName,
        'touristPhone': touristPhone,
        'touristAddress': touristAddress,
        'touristCity': touristCity,
        'touristCountry': touristCountry,
        'touristPostalCode': touristPostalCode,
        'touristPassport': touristPassport,
        'touristPassportCountry': touristPassportCountry,
        'touristPassportDate': touristPassportDate?.toIso8601String(),
        'touristPassportNumber': touristPassportNumber,
        'touristPassportExpiry': touristPassportExpiry?.toIso8601String(),
        'touristPassportIssue': touristPassportIssue?.toIso8601String(),
        'touristPassportPlace': touristPassportPlace,
        'touristPassportType': touristPassportType,
        'touristPassportImage': touristPassportImage,
        'status': status,
        'user_id': userId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      }
    };
  }
}
