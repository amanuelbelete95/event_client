import 'package:event_client/features/auth/domain/entities/user_entity.dart';
import 'package:event_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:event_client/features/auth/presentation/bloc/auth_event.dart';
import 'package:event_client/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



enum AuthenticationStatus {
  isLoading,
  authenticated,
  unauthenticated,
  unknown,
}
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
  final UserEntity user = await _authRepository.login(email: event.email, password: event.password);
  emit(Authenticated(user: user)); 
  } catch (e) {
    final message = e.toString();
    emit(AuthFailure(message: message )); 
  }
}

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
  emit(AuthLoading()); // 1. Show spinner in UI
  try {
    // 2. Perform authentication (e.g. call API with event.email and event.password)
    // await authRepository.register(email: event.email, password: event.password);
    
    emit(Authenticated()); // 3. Notify UI of success
  } catch (e) {
    emit(AuthFailure()); // 4. Notify UI of error
  }
}

  Future<void> _onLogoutPressed(
    LogoutPressed event,
    Emitter<AuthState> emit,
  ) {
    return emit.onEach(stream, onData: onData)
  }
}


