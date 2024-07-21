import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:retrofit/retrofit.dart';
import 'package:myapp/features/auth/data/models/user_model.dart';
import 'package:myapp/features/auth/data/models/tourist_model.dart';
import 'package:myapp/features/auth/data/models/agency_model.dart';

// Création de mocks pour Dio
class MockDio extends Mock implements Dio {}

void main() {
  late AuthRemoteDataSource dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = AuthRemoteDataSource(mockDio);
  });

  group('AuthRemoteDataSource', () {
    final testTouristJson = {
      'id': 1,
      'user_id': 1,
      'touristName': 'Test Tourist',
      'created_at': '2024-07-20T16:56:16.000000Z',
      'updated_at': '2024-07-20T16:56:16.000000Z',
    };

    final testAgencyJson = {
      'id': 1,
      'user_id': 1,
      'agencyName': 'Test Agency',
      'agencyResponsibleName': 'Test Responsible',
      'created_at': '2024-07-20T16:56:16.000000Z',
      'updated_at': '2024-07-20T16:56:16.000000Z',
    };

    final testUserJson = {
      'id': 1,
      'email': 'test@example.com',
      'role': 'user',
    };

    test('registerTourist returns a TouristModel on success', () async {
      when(mockDio.post(
        '/register/tourist',
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: testTouristJson,
        statusCode: 200,
      ));

      final result = await dataSource.registerTourist({
        'email': 'test@example.com',
        'password': 'password',
        'touristName': 'Test Tourist',
      });

      expect(result, isA<TouristModel>());
      expect(result.touristName, 'Test Tourist');
    });

    test('registerAgency returns an AgencyModel on success', () async {
      when(mockDio.post(
        '/register/agency',
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: testAgencyJson,
        statusCode: 200,
      ));

      final result = await dataSource.registerAgency({
        'email': 'test@example.com',
        'password': 'password',
        'agencyName': 'Test Agency',
        'agencyResponsibleName': 'Test Responsible',
      });

      expect(result, isA<AgencyModel>());
      expect(result.agencyName, 'Test Agency');
    });

    test('login returns a UserModel on success', () async {
      when(mockDio.post(
        '/login',
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: testUserJson,
        statusCode: 200,
      ));

      final result = await dataSource.login({
        'email': 'test@example.com',
        'password': 'password',
      });

      expect(result, isA<UserModel>());
      expect(result.email, 'test@example.com');
    });
  });
}
