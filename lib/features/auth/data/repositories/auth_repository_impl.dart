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
    required String firstname,
    required String lastname,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    return await _remoteDataSource.register(
      firstname: firstname,
      lastname: lastname,
      username: username,
      password: password,
      confirmPassword: confirmPassword
    );
  }

  @override
  Future<void> logout() async {
    await _remoteDataSource.logout();
  }
}
