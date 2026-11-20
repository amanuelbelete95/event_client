import 'package:event_client/features/auth/domain/repositories/AuthRepository.dart';
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
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutPressed>(_onLogoutPressed);
  }
  
Future<void> _onLoginRequested(
  LoginRequested event,
  Emitter<AuthState> emit,
) async {
  emit(AuthLoading()); // 1. Show spinner in UI
  try {
    // 2. Perform authentication (e.g. call API with event.email and event.password)
    // await authRepository.login(email: event.email, password: event.password);

  final user = await _auth
    
    emit(Authenticated()); // 3. Notify UI of success
  } catch (e) {
    emit(AuthFailure()); // 4. Notify UI of error
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


