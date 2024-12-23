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
import 'features/reservation/data/datasources/remote/reservation_data_source.dart';
import 'features/reservation/data/repositories/reservation_repository_impl.dart';
import 'features/reservation/domain/repositories/reservation_repository.dart';
import 'features/reservation/domain/usecases/create_reservation_usescase.dart';
import 'features/reservation/domain/usecases/list_reservation_usescase.dart';
import 'features/reservation/presentation/bloc/reservation_page_bloc.dart';
import 'features/transactions/data/datasources/remote/transaction_remote_data_source.dart';
import 'features/transactions/data/repositories/transaction_repository_impl.dart';
import 'features/transactions/domain/repositories/transaction_repository.dart';
import 'features/transactions/domain/usecases/create_transaction_usecase.dart';
import 'features/transactions/presentation/bloc/transaction_page_bloc.dart';

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
  serviceLocator
      .registerLazySingleton<ApiClient>(() => ApiClient(dio: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiClient: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(apiClient: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<ReservationDataSource>(
    () => ReservationDataSource(apiClient: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<TransactionRemoteDataSource>(
    () => TransactionRemoteDataSource(apiClient: serviceLocator()),
  );

  // Repositories
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<ReservationRepository>(
    () => ReservationRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(remoteDataSource: serviceLocator()),
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
  serviceLocator.registerLazySingleton<CreateReservationUsescase>(
    () => CreateReservationUsescase(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ListReservationUsescase>(
    () => ListReservationUsescase(repository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<CreateTransactionUsecase>(
    () => CreateTransactionUsecase(repository: serviceLocator()),
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

  serviceLocator.registerFactory<ReservationBloc>(
    () => ReservationBloc(
      createReservationUsecase: serviceLocator(),
      listReservationUsecase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<HomePageBloc>(
    () => HomePageBloc(homePageUseCases: serviceLocator()),
  );

  serviceLocator.registerFactory<TransactionBloc>(
    () => TransactionBloc(
      createTransactionUsecase: serviceLocator(),
    ),
  );

// Cubits
  serviceLocator.registerFactory<TabCubit>(() => TabCubit());
  serviceLocator.registerFactory<MapCubit>(() => MapCubit());
  serviceLocator.registerFactory<ActivitiesDropdownCubit>(
      () => ActivitiesDropdownCubit());
  serviceLocator.registerFactory<CategoryCubit>(() => CategoryCubit());
}

void registerDependencies() {
  initDependencies();
}
