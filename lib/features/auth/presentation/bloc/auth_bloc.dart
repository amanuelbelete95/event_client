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
    on<OnLoginRequested>(_onLoginRequested);
    on<OnRegisterRequested>(_onRegisterRequested);
    on<OnLogoutPressed>(_onLogoutPressed);
  }
  
Future<void> _onLoginRequested(
  OnLoginRequested event,
  Emitter<AuthState> emit,
) async {
  emit(AuthLoading()); // 1. Show spinner in UI
  try {
    // 2. Perform authentication (e.g. call API with event.email and event.password)
    // await authRepository.login(email: event.email, password: event.password);
    
    emit(Authenticated()); // 3. Notify UI of success
  } catch (e) {
    emit(AuthFailure()); // 4. Notify UI of error
  }
}

  Future<void> _onRegisterRequested(
    OnRegisterRequested event,
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
    OnLogoutPressed event,
    Emitter<AuthState> emit,
  ) {
    return emit.onEach(stream, onData: onData)
  }
}


