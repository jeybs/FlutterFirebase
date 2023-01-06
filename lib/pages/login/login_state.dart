part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginFail extends LoginState {
  final String message;
  const LoginFail(this.message);
}

class AlreadyLoggedIn extends LoginState {
  final bool isLoggedIn;
  const AlreadyLoggedIn(this.isLoggedIn);
}