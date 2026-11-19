// What we want to create here is the state variable for example the email, the password, the confirm password, name

class AuthState {}

class AuthLoading extends AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class AuthFailure extends AuthState {}
