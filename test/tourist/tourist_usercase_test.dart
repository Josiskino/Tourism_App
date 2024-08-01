// import 'package:flutter_test/flutter_test.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:mockito/mockito.dart';
// import 'package:myapp/core/error/failure.dart';
// import 'package:myapp/core/params/params.dart';
// import 'package:myapp/features/auth/domain/entities/tourist.dart';
// import 'package:myapp/features/auth/domain/entities/user.dart';
// import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';
// import '../mocks.mocks.dart';


// void setupMocks() {
//   provideDummy<Either<Failure, Tourist>>(const Right(Tourist(
//     id: 0,
//     user: User(id: 1, email: 'test1@gmail.com', role: 'tourist'),
//     touristName: 'josué Marcus',
//   )));
// }

// void main() {
//   setupMocks();

//   late RegisterTouristUseCase usecase;
//   late MockTouristRepository mockTouristRepository;

//   setUp(() {
//     mockTouristRepository = MockTouristRepository();
//     usecase = RegisterTouristUseCase(repository: mockTouristRepository);
//   });

//   const tUser = User(id: 3, email: 'test2@gmail.com', role: 'tourist');
//   const tTourist = Tourist(id: 2, user: tUser, touristName: 'Marcus LASSEY');
//   final tParams = TemplateParams(params: {
//     'email': 'test2@gmail.com',
//     'password': 'azertyuiop',
//     'touristName': 'Marcus LASSEY'
//   });

//   test('should register a tourist successfully', () async {
//     // Arrange
//     when(mockTouristRepository.registerTourist(any))
//         .thenAnswer((_) async => const Right(tTourist));

//     // Act
//     final result = await usecase(tParams);

//     // Assert
//     expect(result, const Right(tTourist));
//     verify(mockTouristRepository.registerTourist(tParams));
//     verifyNoMoreInteractions(mockTouristRepository);
//   });

//   test('should return a failure when registration fails', () async {
//     // Arrange
//     final tFailure = ServerFailure('Registration failed');
//     when(mockTouristRepository.registerTourist(any))
//         .thenAnswer((_) async => Left(tFailure));

//     // Act
//     final result = await usecase(tParams);

//     // Assert
//     expect(result, Left(tFailure));
//     verify(mockTouristRepository.registerTourist(tParams));
//     verifyNoMoreInteractions(mockTouristRepository);
//   });
// }
