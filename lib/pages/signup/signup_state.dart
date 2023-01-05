part of 'signup_cubit.dart';

@immutable
abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {
  const SignupInitial();
}

class SignupSuccess extends SignupState {
  const SignupSuccess();
}

class SignupFailed extends SignupState {
  final String message;
  const SignupFailed(this.message);
}
