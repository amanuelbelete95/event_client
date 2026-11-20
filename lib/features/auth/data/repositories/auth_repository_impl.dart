import 'package:event_client/features/auth/domain/entities/user_entity.dart';
import 'package:event_client/features/auth/domain/repositories/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> register({required String name, required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

}