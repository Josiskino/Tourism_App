import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/login_tourist_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/login_agency_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterTouristUseCase _registerTouristUseCase;
  final RegisterAgencyUseCase _registerAgencyUseCase;
  final LoginTouristUseCase _loginTouristUseCase;
  final LoginAgencyUseCase _loginAgencyUseCase;

  AuthBloc({
    required RegisterTouristUseCase registerTouristUseCase,
    required RegisterAgencyUseCase registerAgencyUseCase,
    required LoginTouristUseCase loginTouristUseCase,
    required LoginAgencyUseCase loginAgencyUseCase,
  })  : _registerTouristUseCase = registerTouristUseCase,
        _registerAgencyUseCase = registerAgencyUseCase,
        _loginTouristUseCase = loginTouristUseCase,
        _loginAgencyUseCase = loginAgencyUseCase,
        super(AuthInitial()) {
    on<RegisterTouristEvent>(_onRegisterTouristEvent);
    on<RegisterAgencyEvent>(_onRegisterAgencyEvent);
    on<LoginEvent>(_onLoginEvent);
  }

  Future<void> _onRegisterTouristEvent(
    RegisterTouristEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _registerTouristUseCase(
      TemplateParams(params: {
        'email': event.email,
        'password': event.password,
        'touristName': event.touristName,
      }),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(const AuthSuccess(
          null)), // Vous pouvez ajuster en fonction de ce que vous voulez retourner
    );
  }

  Future<void> _onRegisterAgencyEvent(
    RegisterAgencyEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _registerAgencyUseCase(
      TemplateParams(
        params: {
          'email': event.email,
          'password': event.password,
          'agencyName': event.agencyName,
          'agencyResponsibleName': event.agencyResponsibleName,
        },
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(const AuthSuccess(
          null)), // Vous pouvez ajuster en fonction de ce que vous voulez retourner
    );
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _loginTouristUseCase(
      TemplateParams(
        params: {
          'email': event.email,
          'password': event.password,
        },
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (tourist) {
        if (tourist.role == "tourist") {
          emit(AuthSuccess(tourist));
        } else {
          emit(const AuthFailure("User role not recognized"));
        }
      },
    );
  }
}
