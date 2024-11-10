import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:myapp/core/services/api_client.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/data/repositories/agency_repository_impl.dart';
import 'package:myapp/features/auth/data/repositories/tourist_repository_impl.dart';
import 'package:myapp/features/auth/domain/repositories/tourist_repository.dart';
import 'package:myapp/features/auth/domain/repositories/agency_repository.dart';
import 'package:myapp/features/auth/domain/usecases/register_tourist_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_agency_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/login_tourist_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/login_agency_usecase.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/main_screen/bloc/cubit/activities_dropdown_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/tab_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/category_cubit.dart';

import 'core/constants/api_constant.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  
  // External
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        responseType: ResponseType.json,
      ),
    ),
  );

  // ApiClient
  sl.registerLazySingleton<ApiClient>(() => ApiClient(dio: sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiClient: sl()),
  );

  // Repositories
  sl.registerLazySingleton<TouristRepository>(
    () => TouristRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<AgencyRepository>(
    () => AgencyRepositoryImpl(remoteDataSource: sl()),
  );
  
  // Use cases
  sl.registerLazySingleton<RegisterTouristUseCase>(
    () => RegisterTouristUseCase(repository: sl()),
  );
  sl.registerLazySingleton<RegisterAgencyUseCase>(
    () => RegisterAgencyUseCase(repository: sl()),
  );
  sl.registerLazySingleton<LoginTouristUseCase>(
    () => LoginTouristUseCase(repository: sl()),
  );
  sl.registerLazySingleton<LoginAgencyUseCase>(
    () => LoginAgencyUseCase(repository: sl()),
  );

  // Blocs
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      registerTouristUseCase: sl(),
      registerAgencyUseCase: sl(),
      loginAgencyUseCase: sl(), // Util
      loginTouristUseCase: sl(), // Util
    ),
  );

// Cubits
  sl.registerFactory<TabCubit>(() => TabCubit());
  sl.registerFactory<MapCubit>(() => MapCubit());
  sl.registerFactory<ActivitiesDropdownCubit>(() => ActivitiesDropdownCubit());
  sl.registerFactory<CategoryCubit>(() => CategoryCubit());
}

void registerDependencies() {
  initDependencies();
}