import 'package:event_client/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  /// Signs in a user with username and password
  Future<UserEntity> login({
    required String username,
    required String password,
  });

  /// Registers a new user account
  Future<UserEntity> register({
    required String firstname,
    required String lastname,
    required String username,
    required String password,
    required String confirmPassword,
  });

  /// Logs out the current user
  Future<void> logout();
}
