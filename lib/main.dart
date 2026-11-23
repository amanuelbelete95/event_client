import 'package:dio/dio.dart';
import 'package:event_client/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:event_client/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:event_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:event_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:event_client/features/auth/presentation/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:4000'
  ));
  final remoteDataSource = AuthRemoteDataSourceImpl(dio);
  final authRepository = AuthRepositoryImpl(remoteDataSource);

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository),
      child: MaterialApp(
        title: 'event management system',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
