import 'package:dio/dio.dart';
import 'package:event_client/core/error/exceptions.dart';
import 'package:event_client/features/auth/data/models/auth_models.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String username,
    required String password,
  });

  Future<UserModel> register({
    required String name,
    required String username,
    required String password,
  });

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  String _extractErrorMessage(DioException e, {required String fallback}) {
    final responseData = e.response?.data;
    if (responseData is Map<String, dynamic>) {
      final serverMessage = responseData['message'] ?? responseData['error'];
      if (serverMessage is String && serverMessage.isNotEmpty) {
        return serverMessage;
      }
    }
    return e.message ?? fallback;
  }

  Map<String, dynamic> _normalizeResponseMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('user') && data['user'] is Map<String, dynamic>) {
        return data;
      }
      return {'user': data};
    }
    return {'user': <String, dynamic>{}};
  }

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/api/login',
        data: {'username': username, 'password': password},
      );

      return UserModel.fromJson(_normalizeResponseMap(response.data));
    } on DioException catch (e) {
      throw ServerException(_extractErrorMessage(e, fallback: 'Login Failed'));
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/api/register',
        data: {'name': name, 'username': username, 'password': password},
      );

      return UserModel.fromJson(_normalizeResponseMap(response.data));
    } on DioException catch (e) {
      throw ServerException(_extractErrorMessage(e, fallback: 'Registration failed'));
    }
  }

  @override
  Future<void> logout() async {}
}
