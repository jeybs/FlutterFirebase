import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  late FirebaseServices _firebaseServices;

  LoginCubit() : super(LoginInitial()) {
    _firebaseServices = FirebaseServices();
  }

  login(String email, String password) async {
    _firebaseServices.isMobileExist(email);
    return;
    Future.delayed(Duration(seconds: 1), () {
      if(email.isEmpty || password.isEmpty) {
        emit(LoginFail("Kindly enter your email address and password"));
        return;
      }

      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
        print("signup success => ${value}");
        emit(LoginSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(LoginFail("Email / Password incorrent"));
      });
    });
  }

}
