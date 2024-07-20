import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterTouristUseCase _registerTouristUseCase;
  final RegisterAgencyUseCase _registerAgencyUseCase;
  final LoginUseCase _loginUseCase;

  AuthBloc({
    required RegisterTouristUseCase registerTouristUseCase,
    required RegisterAgencyUseCase registerAgencyUseCase,
    required LoginUseCase loginUseCase,
  })  : _registerTouristUseCase = registerTouristUseCase,
        _registerAgencyUseCase = registerAgencyUseCase,
        _loginUseCase = loginUseCase,
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
      TemplateParams(
        params: {
          'email': event.email,
          'userId': event.password,
          'touristName': event.touristName,
        }
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (tourist) => emit(AuthSuccess(tourist)),
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
          'id': event.id,
          'userId': event.userId,
          'agencyName': event.agencyName,
          'agencyResponsibleName': event.agencyResponsibleName,
        },
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (agency) => emit(AuthSuccess(agency)),
    );
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _loginUseCase(
      TemplateParams(
        params: {
          'email': event.email,
          'password': event.password,
        },
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
