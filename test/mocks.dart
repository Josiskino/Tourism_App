import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/domain/repositories/tourist_repository.dart';
import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';

@GenerateMocks([
  AuthRemoteDataSource,
  Dio,
  TouristRepository, 
  RegisterTouristUseCase, 
  RegisterAgencyUseCase, 
])
void main() {}
