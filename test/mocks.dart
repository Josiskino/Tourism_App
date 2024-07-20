import 'package:mockito/annotations.dart';
import 'package:myapp/features/auth/domain/repositories/tourist_repository.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';

@GenerateMocks([
  TouristRepository, 
  RegisterTouristUseCase, 
  RegisterAgencyUseCase, 
  LoginUseCase,
])
void main() {}
