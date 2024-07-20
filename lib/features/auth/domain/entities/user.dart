import 'package:equatable/equatable.dart';

class User extends Equatable {
  
  final int? id;
  final String email;
  final String role;

  const User({
    this.id,
    required this.email,
    required this.role,
  });
  
  @override
  List<Object?> get props => [id, email, role];
}