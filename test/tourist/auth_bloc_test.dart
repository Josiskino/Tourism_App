// import 'package:bloc_test/bloc_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';
// import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
// import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
// import 'package:myapp/core/error/failure.dart';
// import 'package:myapp/core/params/params.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:myapp/features/auth/domain/entities/user.dart';
// import 'package:myapp/features/auth/domain/entities/tourist.dart';
// import 'package:myapp/features/auth/domain/entities/agency.dart';

// // Classes fictives pour les use cases
// class MockRegisterTouristUseCase extends Mock implements RegisterTouristUseCase {}
// class MockRegisterAgencyUseCase extends Mock implements RegisterAgencyUseCase {}
// class MockLoginUseCase extends Mock implements LoginUseCase {}

// // Classe fictive pour TemplateParams
// class FakeTemplateParams extends Fake implements TemplateParams {}

// void main() {
//   late AuthBloc authBloc;
//   late MockRegisterTouristUseCase mockRegisterTouristUseCase;
//   late MockRegisterAgencyUseCase mockRegisterAgencyUseCase;
//   late MockLoginUseCase mockLoginUseCase;

//   setUpAll(() {
//     registerFallbackValue(FakeTemplateParams());
//   });

//   setUp(() {
//     mockRegisterTouristUseCase = MockRegisterTouristUseCase();
//     mockRegisterAgencyUseCase = MockRegisterAgencyUseCase();
//     mockLoginUseCase = MockLoginUseCase();

//     authBloc = AuthBloc(
//       registerTouristUseCase: mockRegisterTouristUseCase,
//       registerAgencyUseCase: mockRegisterAgencyUseCase,
//       loginUseCase: mockLoginUseCase,
//     );
//   });

//   group('AuthBloc', () {
//     test('initial state is AuthInitial', () {
//       expect(authBloc.state, AuthInitial());
//     });

//     blocTest<AuthBloc, AuthState>(
//       'emits [AuthLoading, AuthSuccess] when RegisterTouristEvent is added and succeeds',
//       build: () {
//         when(() => mockRegisterTouristUseCase(any()))
//             .thenAnswer((_) async => const Right(Tourist(id: 1, user: User(id: 1, email: 'test@test.com', role: 'tourist'), touristName: 'John Doe')));
//         return authBloc;
//       },
//       act: (bloc) => bloc.add(const RegisterTouristEvent(email: 'test@test.com', password: 'password', touristName: 'John Doe')),
//       expect: () => [AuthLoading(), const AuthSuccess(Tourist(id: 1, user: User(id: 1, email: 'test@test.com', role: 'tourist'), touristName: 'John Doe'))],
//     );

//     blocTest<AuthBloc, AuthState>(
//       'emits [AuthLoading, AuthFailure] when RegisterTouristEvent is added and fails',
//       build: () {
//         when(() => mockRegisterTouristUseCase(any()))
//             .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
//         return authBloc;
//       },
//       act: (bloc) => bloc.add(const RegisterTouristEvent(email: 'test@test.com', password: 'password', touristName: 'John Doe')),
//       expect: () => [AuthLoading(), const AuthFailure('Server Failure')],
//     );

//     blocTest<AuthBloc, AuthState>(
//       'emits [AuthLoading, AuthSuccess] when RegisterAgencyEvent is added and succeeds',
//       build: () {
//         when(() => mockRegisterAgencyUseCase(any()))
//             .thenAnswer((_) async => const Right(Agency(id: 1, user: User(id: 1, email: 'test@test.com', role: 'agency'), agencyName: 'Agency Name', agencyResponsibleName: 'Responsible Name')));
//         return authBloc;
//       },
//       act: (bloc) => bloc.add(const RegisterAgencyEvent(email: 'test@test.com', password: 'password', agencyName: 'Agency Name', agencyResponsibleName: 'Responsible Name')),
//       expect: () => [AuthLoading(), const AuthSuccess(Agency(id: 1, user: User(id: 1, email: 'test@test.com', role: 'agency'), agencyName: 'Agency Name', agencyResponsibleName: 'Responsible Name'))],
//     );

//     blocTest<AuthBloc, AuthState>(
//       'emits [AuthLoading, AuthFailure] when RegisterAgencyEvent is added and fails',
//       build: () {
//         when(() => mockRegisterAgencyUseCase(any()))
//             .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
//         return authBloc;
//       },
//       act: (bloc) => bloc.add(const RegisterAgencyEvent(email: 'test@test.com', password: 'password', agencyName: 'Agency Name', agencyResponsibleName: 'Responsible Name')),
//       expect: () => [AuthLoading(), const AuthFailure('Server Failure')],
//     );

//     blocTest<AuthBloc, AuthState>(
//       'emits [AuthLoading, AuthSuccess] when LoginEvent is added and succeeds',
//       build: () {
//         when(() => mockLoginUseCase(any()))
//             .thenAnswer((_) async => const Right(User(id: 1, email: 'test@test.com', role: 'user')));
//         return authBloc;
//       },
//       act: (bloc) => bloc.add(const LoginEvent(email: 'test@test.com', password: 'password')),
//       expect: () => [AuthLoading(), const AuthSuccess(User(id: 1, email: 'test@test.com', role: 'user'))],
//     );

//     blocTest<AuthBloc, AuthState>(
//       'emits [AuthLoading, AuthFailure] when LoginEvent is added and fails',
//       build: () {
//         when(() => mockLoginUseCase(any()))
//             .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
//         return authBloc;
//       },
//       act: (bloc) => bloc.add(const LoginEvent(email: 'test@test.com', password: 'password')),
//       expect: () => [AuthLoading(), const AuthFailure('Server Failure')],
//     );
//   });
// }
