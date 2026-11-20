import 'package:event_client/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:event_client/features/auth/data/models/auth_models.dart';
import 'package:event_client/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await _remoteDataSource.login(email: email, password: password);
    throw UnimplementedError();
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await _remoteDataSource.register(
      name: name,
      email: email,
      password: password,
    );
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
