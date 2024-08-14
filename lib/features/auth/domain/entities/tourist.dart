import 'package:equatable/equatable.dart';

class Tourist extends Equatable {
  final int id;
  final String email;
  final String role;
  final String touristName;
  final String createdAt;
  final String updatedAt;

  const Tourist({
    required this.id,
    required this.email,
    required this.role,
    required this.touristName,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        role,
        touristName,
        createdAt,
        updatedAt,
  ];
}
