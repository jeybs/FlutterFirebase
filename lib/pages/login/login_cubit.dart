import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginInitial());

  login(String email, String password) async {
    if(email.isEmpty || password.isEmpty) {
      emit(const LoginFail("Kindly enter your email address and password"));
      return;
    }

    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      print("signup success => ${value}");
      emit(const LoginSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(const LoginFail("Email / Password incorrent"));
    });
  }

}
