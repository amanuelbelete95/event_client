import 'package:event_client/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.username,
    required super.name,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userJson = (json['user'] is Map<String, dynamic>)
        ? json['user'] as Map<String, dynamic>
        : json;

    return UserModel(
      id: (userJson['id'] ?? userJson['_id'] ?? '').toString(),
      name: (userJson['name'] ?? userJson['fullName'] ?? userJson['username'] ?? '').toString(),
      username: (userJson['username'] ?? userJson['email'] ?? '').toString(),
      role: (userJson['role'] ?? 'user').toString(),
    );
  }
}
