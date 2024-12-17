import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:myapp/core/services/api_client.dart';
import 'package:myapp/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:myapp/features/auth/data/repositories/user_repository_impl.dart';
import 'package:myapp/features/auth/domain/repositories/user_repository.dart';
import 'package:myapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:myapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/main_screen/bloc/cubit/activities_dropdown_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/tab_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/category_cubit.dart';

import 'core/abstract/local_storage/local_storage_service.dart';
import 'core/constants/api_constant.dart';
import 'core/services/local_storage_service.dart';
import 'features/home_page/data/datasources/remote/home_page_data_source.dart';
import 'features/home_page/data/repositories/home_page_data_repository_impl.dart';
import 'features/home_page/domain/repositories/home_page_data_repository.dart';
import 'features/home_page/domain/usecases/home_page_usecases.dart';
import 'features/home_page/presentation/bloc/home_page_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  
  // External
  serviceLocator.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    ),
  );

  // ApiClient
  serviceLocator.registerLazySingleton<ApiClient>(() => ApiClient(dio: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiClient: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(apiClient: serviceLocator()),
  );

  // Repositories
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  // Use cases
  serviceLocator.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomePageUseCases>(
    () => HomePageUseCases(repository: serviceLocator()),
  );

  // LocalStorageService
  serviceLocator.registerLazySingleton<LocalStorageService>(
    () => LocalStorageServiceImpl(serviceLocator()),
  );

  // Initialiser le token au démarrage
  final localStorageService = serviceLocator<LocalStorageService>();
  await localStorageService.initializeToken();

  // Blocs
  serviceLocator.registerFactory<AuthBloc>(
    () => AuthBloc(
      registerUsecase: serviceLocator(),
      loginUsecase: serviceLocator(),
      localStorageService: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<HomePageBloc>(
    () => HomePageBloc(homePageUseCases: serviceLocator()),
  );

// Cubits
  serviceLocator.registerFactory<TabCubit>(() => TabCubit());
  serviceLocator.registerFactory<MapCubit>(() => MapCubit());
  serviceLocator.registerFactory<ActivitiesDropdownCubit>(() => ActivitiesDropdownCubit());
  serviceLocator.registerFactory<CategoryCubit>(() => CategoryCubit());
}

void registerDependencies() {
  initDependencies();
}