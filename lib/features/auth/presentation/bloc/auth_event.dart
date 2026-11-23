//We need to create an event here
// When ever we click on the login button,
// the state either goes loading, error or authenticated
// So we will have onLogin event -----Loading, Error or Success -

// The event that will be triggered on button click for login

// Where the values comes from: In your UI layerr, you read the current text from the controller or form state or AuthState at the moment
// the users taps login, pass those those string into the LoginRequested

//

class AuthEvent {
  final String username;
  final String password;

  AuthEvent({required this.username, required this.password});
}

class LoginRequested extends AuthEvent {
  LoginRequested({required super.username, required super.password});
}

class RegisterRequested extends AuthEvent {
  final String firstname;
  final String lastname;
  final String confirmPassword;

  RegisterRequested({
    required super.username,
    required super.password,
    required this.firstname,
    required this.lastname,
    required this.confirmPassword,
  });
}

class LogoutPressed extends AuthEvent {
  LogoutPressed({required super.username, required super.password});
}
