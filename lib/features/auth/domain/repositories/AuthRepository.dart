import 'package:event_client/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  /// Signs in a user with email and password
  Future<UserEntity> login({
    required String email,
    required String password,
  });

  /// Registers a new user account
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
  });

  /// Logs out the current user
  Future<void> logout();

  // /// Gets the currently authenticated user session (if any)
  // Future<UserEntity?> getCurrentUser();
}
