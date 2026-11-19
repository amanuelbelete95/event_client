import 'package:event_client/features/auth/presentation/bloc/auth_event.dart';
import 'package:event_client/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<LoginRequested, AuthState> {
  AuthBloc() : super(AuthInitial());
}
