part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RegisterTouristEvent extends AuthEvent {
  final String email;
  final String password;
  final String touristName;

  const RegisterTouristEvent({
    required this.email,
    required this.password,
    required this.touristName,
  });

   @override
  List<Object?> get props => [email, password, touristName];
}

class RegisterAgencyEvent extends AuthEvent {
  final String email;
  final String password;
  final String agencyName;
  final String agencyResponsibleName;

  const RegisterAgencyEvent({
    required this.email,
    required this.password,
    required this.agencyName,
    required this.agencyResponsibleName,
  });

  @override
  List<Object?> get props => [email, password, agencyName, agencyResponsibleName];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
