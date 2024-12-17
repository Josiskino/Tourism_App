part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AuthSuccess extends AuthState {
  //final dynamic user;
  final UserModel? user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user ?? 'no_user'];
}

