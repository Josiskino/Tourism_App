import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/abstract/local_storage/local_storage_service.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/core/error/failure.dart';

import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_usecase.dart';

import '../../data/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;
  final LocalStorageService _localStorageService;

  AuthBloc({
    required RegisterUsecase registerUsecase,
    required LoginUsecase loginUsecase,
    required LocalStorageService localStorageService,
  })  : _registerUsecase = registerUsecase,
        _loginUsecase = loginUsecase,
        _localStorageService = localStorageService,
        super(AuthInitial()) {
    on<RegisterEvent>(_onRegisterEvent);
    on<LoginEvent>(_onLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<CheckAuthStatusEvent>(_onCheckAuthStatusEvent);
  }

  Future<void> _onRegisterEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    final result = await _registerUsecase(
      TemplateParams(
        params: {
          'email': event.email,
          'password': event.password,
          'touristName': event.touristName,
          'touristPhone': event.touristPhone,
        },
      ),
    );

    result.fold(
      (failure) => emit(AuthFailure(_mapFailureToMessage(failure))),
      (_) => emit(const AuthSuccess(null)),
    );
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final result = await _loginUsecase(
        TemplateParams(
          params: {
            'email': event.email,
            'password': event.password,
          },
        ),
      );

      final resultState = await result.fold(
        // En cas d'échec
        (failure) async {
          return AuthFailure(_mapFailureToMessage(failure));
        },
        // En cas de succès
        (user) async {
          // Récupérer le token de manière asynchrone
          final token = await _localStorageService.getToken();

          if (token != null) {
            user.token = token;
            return AuthSuccess(user);
          } else {
            return const AuthFailure("Impossible de récupérer le token");
          }
        },
      );

      // Émettre l'état final
      emit(resultState);
    } catch (error) {
      emit(AuthFailure("Une erreur inattendue est survenue : $error"));
    }
  }

  Future<void> _onLogoutEvent(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Supprimer le token
      await _localStorageService.removeToken();

      // Émettre un état de déconnexion
      emit(AuthInitial());
    } catch (error) {
      emit(AuthFailure("Erreur lors de la déconnexion : $error"));
    }
  }

  Future<void> _onCheckAuthStatusEvent(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Vérifier si un token existe
      final token = await _localStorageService.getToken();

      if (token != null) {
        // Token existe, l'utilisateur est connecté
        emit(const AuthSuccess(
            null)); // Vous pouvez passer l'utilisateur si nécessaire
      } else {
        // Pas de token, utilisateur non connecté
        emit(AuthInitial());
      }
    } catch (error) {
      emit(AuthFailure(
          "Erreur lors de la vérification de l'authentification : $error"));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      switch (failure.message) {
        case 'Invalid credentials':
          return 'Identifiants incorrects';
        case 'Network error':
          return 'Problème de connexion';
        default:
          return failure.message;
      }
    }
    return 'Une erreur est survenue';
  }
}
