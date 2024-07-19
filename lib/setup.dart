import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/data/repository/agency_repository_impl.dart';
import 'package:myapp/features/auth/data/repository/tourist_repository_impl.dart';
//import 'package:myapp/features/auth/data/repository/user_repository_impl.dart';
import 'package:myapp/features/auth/domain/repository/tourist_repository.dart';
import 'package:myapp/features/auth/domain/repository/agency_repository.dart';
//import 'package:myapp/features/auth/domain/repository/user_repository.dart';
import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final dio = Dio();
  sl.registerLazySingleton(() => Dio());

  // Data sources
  //sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dio: sl()));

  // Retrofit instance
  final authRemoteDataSource = AuthRemoteDataSource(dio);
  sl.registerLazySingleton<AuthRemoteDataSource>(() => authRemoteDataSource);

  // Repositories
  sl.registerLazySingleton<TouristRepository>(() => TouristRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<AgencyRepository>(() => AgencyRepositoryImpl(remoteDataSource: sl()));
  //sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl()));

  // Use cases
  sl.registerLazySingleton(() => RegisterTouristUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterAgencyUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
}
