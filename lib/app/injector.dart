import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../core/api/api_consumer.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/dio_consumer.dart';
import '../core/database/secure_local_storage.dart';
import '../modules/auth/data/datasources/auth_remote_data_source.dart';
import '../modules/auth/data/repositories/auth_repository_implementation.dart';
import '../modules/auth/domain/repositories/auth_repository.dart';
import '../modules/auth/domain/usecases/otp_use_case.dart';
import '../modules/auth/domain/usecases/verify_phone_use_case.dart';
import '../modules/auth/presentation/bloc/login/login_bloc.dart';
import '../modules/auth/presentation/bloc/verify/verify_phone_bloc.dart';
import '../modules/help/data/datasources/help_remote_data_source.dart';
import '../modules/help/data/repositories/help_repository_implementation.dart';
import '../modules/help/domain/repositories/help_repository.dart';
import '../modules/help/domain/usecases/get_help_use_case.dart';
import '../modules/help/presentation/bloc/help_bloc.dart';
import '../modules/home/data/datasources/home_remote_data_source.dart';
import '../modules/home/data/repositories/home_repository_implementation.dart';
import '../modules/home/domain/repositories/home_repository.dart';
import '../modules/home/domain/usecases/get_all_products_use_case.dart';
import '../modules/home/presentation/bloc/home_bloc.dart';
import '../modules/splash/presentation/bloc/splash_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  //!Feature
  //Bloc

  serviceLocator.registerFactory(
    () => SplashBloc(
      secureLocalStorage: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => LoginBloc(
      verifyPhoneUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => VerifyPhoneBloc(
      splashBloc: serviceLocator(),
      verifyPhoneUseCase: serviceLocator(),
      otpUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomeBloc(
      getAllProductsUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HelpBloc(
      getHelpUseCase: serviceLocator(),
    ),
  );
  //use Case
  serviceLocator.registerLazySingleton(
    () => OtpUseCase(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => VerifyPhoneUseCase(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetHelpUseCase(
      helpRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetAllProductsUseCase(
      homeRepository: serviceLocator(),
    ),
  );

  //Repo
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(
      authRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HelpRepository>(
    () => HelpRepositoryImplementation(
      helpRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplementation(
      homeRemoteDataSource: serviceLocator(),
    ),
  );

  //Data Source
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementation(
      dioConsumer: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HelpRemoteDataSource>(
    () => HelpRemoteDataSourceImplementation(
      dioConsumer: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImplementation(
      dioConsumer: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton<SecureLocalStorage>(() =>
      SecureLocalStorageImplementation(flutterSecureStorage: serviceLocator()));
  //!External
  serviceLocator.registerLazySingleton(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    ),
  );

  serviceLocator.registerLazySingleton(() => AppInterceptor());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      error: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator
      .registerLazySingleton(() => DioConsumer(client: serviceLocator()));
}
