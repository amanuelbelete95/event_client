import 'package:event_client/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:event_client/features/auth/domain/entities/user_entity.dart';
import 'package:event_client/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<UserEntity> login({
    required String username,
    required String password,
  }) async {
    return await _remoteDataSource.login(
      username: username,
      password: password,
    );
  }

  @override
  Future<UserEntity> register({
    required String name,
    required String username,
    required String password,
  }) async {
    return await _remoteDataSource.register(
      name: name,
      username: username,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _remoteDataSource.logout();
  }
}
