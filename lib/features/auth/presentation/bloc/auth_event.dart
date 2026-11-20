//We need to create an event here
// When ever we click on the login button,
// the state either goes loading, error or authenticated
// So we will have onLogin event -----Loading, Error or Success -

// The event that will be triggered on button click for login

// Where the values comes from: In your UI layerr, you read the current text from the controller or form state or AuthState at the moment
// the users taps login, pass those those string into the LoginRequested

//

class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class RegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  RegisterRequested({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LogoutPressed extends AuthEvent {}
