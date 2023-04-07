part of 'splash_cubit.dart';

@immutable
abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class IsUserLoggedIn extends SplashState {
  final bool isLoggedIn;
  const IsUserLoggedIn(this.isLoggedIn);
}
