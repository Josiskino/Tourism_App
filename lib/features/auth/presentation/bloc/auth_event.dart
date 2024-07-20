part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterTouristEvent extends AuthEvent {
  final String email;
  final String password;
  final String touristName;

  RegisterTouristEvent({
    required this.email,
    required this.password,
    required this.touristName,
  });
}

class RegisterAgencyEvent extends AuthEvent {
  final int id;
  final int userId;
  final String agencyName;
  final String agencyResponsibleName;

  RegisterAgencyEvent({
    required this.id,
    required this.userId,
    required this.agencyName,
    required this.agencyResponsibleName,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}
