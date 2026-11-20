import 'package:event_client/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.username,
    required super.name,
    required super.role,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userJson = (json['user'] as Map<String, dynamic>);
    return UserModel(
      id: userJson['id'].toString(),
      name: userJson['name'] as String,
      username: userJson['username'] as String,
      role: (userJson['role'] as String?) ?? 'user',
    );
  }


}
