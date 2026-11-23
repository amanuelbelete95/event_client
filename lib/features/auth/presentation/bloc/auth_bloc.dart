import 'package:event_client/features/auth/domain/entities/user_entity.dart';
import 'package:event_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:event_client/features/auth/presentation/bloc/auth_event.dart';
import 'package:event_client/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final UserEntity user = await _authRepository.login(
        username: event.username,
        password: event.password,
      );
      emit(Authenticated(user: user));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final UserEntity user = await _authRepository.register(
        name: event.name,
        username: event.username,
        password: event.password,
      );
      emit(Authenticated(user: user));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onLogoutPressed(
    LogoutPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepository.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
