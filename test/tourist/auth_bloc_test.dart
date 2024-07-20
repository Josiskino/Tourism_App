import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myapp/features/auth/domain/entities/user.dart';
import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/features/auth/domain/entities/tourist.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';

// Création des mocks
class MockRegisterTouristUseCase extends Mock implements RegisterTouristUseCase {}
class MockRegisterAgencyUseCase extends Mock implements RegisterAgencyUseCase {}
class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late AuthBloc authBloc;
  late MockRegisterTouristUseCase mockRegisterTouristUseCase;
  late MockRegisterAgencyUseCase mockRegisterAgencyUseCase;
  late MockLoginUseCase mockLoginUseCase;

  setUpAll(() {
    registerFallbackValue(TemplateParams(params: {}));
  });

  setUp(() {
    mockRegisterTouristUseCase = MockRegisterTouristUseCase();
    mockRegisterAgencyUseCase = MockRegisterAgencyUseCase();
    mockLoginUseCase = MockLoginUseCase();
    authBloc = AuthBloc(
      registerTouristUseCase: mockRegisterTouristUseCase,
      registerAgencyUseCase: mockRegisterAgencyUseCase,
      loginUseCase: mockLoginUseCase,
    );
  });

  group('RegisterTouristEvent', () {
    final tTourist = Tourist(
      id: 1,
      user: User(id: 1, email: 'test@example.com', role: 'tourist'),
      touristName: 'Marcus LASSEY',
    );

    test('emits [AuthLoading, AuthSuccess] when RegisterTouristUseCase succeeds', () async {
      when(() => mockRegisterTouristUseCase(any()))
          .thenAnswer((_) async => Right(tTourist));

      // Envoie l'événement
      authBloc.add(RegisterTouristEvent(
        email: 'test@example.com',
        password: 'password123',
        touristName: 'Marcus LASSEY',
      ));

      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthLoading(),
          AuthSuccess(tTourist),
        ]),
      ).timeout(Duration(seconds: 60)); // Assurez-vous que le délai est suffisant
    });

    test('emits [AuthLoading, AuthFailure] when RegisterTouristUseCase fails', () async {
      when(() => mockRegisterTouristUseCase(any()))
          .thenAnswer((_) async => Left(ServerFailure('Server error')));

      // Envoie l'événement
      authBloc.add(RegisterTouristEvent(
        email: 'test@example.com',
        password: 'password123',
        touristName: 'Marcus LASSEY',
      ));

      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthLoading(),
          AuthFailure('Server error'),
        ]),
      ).timeout(Duration(seconds: 60)); // Assurez-vous que le délai est suffisant
    });
  });
}
