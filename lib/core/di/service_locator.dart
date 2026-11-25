import 'package:dio/dio.dart';
import 'package:event_client/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:event_client/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:event_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:event_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // sl stands for Service Locator

void initDependencies() {
  // External
  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'http://localhost:4000')));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(sl()));
}