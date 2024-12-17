import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String touristName;
  final String? touristUserName;
  final String? touristPhone;
  final String? touristAddress;
  final String? touristCity;
  final String? touristCountry;
  final String? touristPostalCode;
  final String? touristPassport;
  final String? touristPassportCountry;
  final DateTime? touristPassportDate;
  final String? touristPassportNumber;
  final DateTime? touristPassportExpiry;
  final DateTime? touristPassportIssue;
  final String? touristPassportPlace;
  final String? touristPassportType;
  final String? touristPassportImage;
  final int status;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  const User({
    required this.id,
    required this.email,
    required this.touristName,
    this.touristUserName,
    this.touristPhone,
    this.touristAddress,
    this.touristCity,
    this.touristCountry,
    this.touristPostalCode,
    this.touristPassport,
    this.touristPassportCountry,
    this.touristPassportDate,
    this.touristPassportNumber,
    this.touristPassportExpiry,
    this.touristPassportIssue,
    this.touristPassportPlace,
    this.touristPassportType,
    this.touristPassportImage,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        touristName,
        email,
        touristUserName,
        touristPhone,
        touristAddress,
        touristCity,
        touristCountry,
        touristPostalCode,
        touristPassport,
        touristPassportCountry,
        touristPassportDate,
        touristPassportNumber,
        touristPassportExpiry,
        touristPassportIssue,
        touristPassportPlace,
        touristPassportType,
        touristPassportImage,
        status,
        userId,
        createdAt,
        updatedAt,
      ];
}