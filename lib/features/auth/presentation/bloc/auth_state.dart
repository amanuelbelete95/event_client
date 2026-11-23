// What we want to create here is the state variable for example the email, the password, the confirm password, name

import 'package:event_client/features/auth/domain/entities/user_entity.dart';

class AuthState {}

class AuthLoading extends AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity user;

  Authenticated({required this.user});
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}
