import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {

  late FirebaseServices _firebaseServices;

  SignupCubit() : super(SignupInitial()) {
    _firebaseServices = FirebaseServices();
  }


  signup(String name, String email, String mobile, String password, String confirmPassword, bool termAgreement)  {
    Future.delayed(const Duration(seconds: 1), () async {
      if(name.isEmpty || email.isEmpty || mobile.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        emit(SignupFailed("Kindly fill up all required fields"));
        return;
      }

      if(!EmailValidator.validate(email)) {
        emit(SignupFailed("Invalid email address format"));
        return;
      }

      if(password != confirmPassword) {
        emit(SignupFailed("Password did not match"));
        return;
      }

      if(!termAgreement) {
        emit(SignupFailed("Kindly agree to our Privacy Policy, Terms and Conditions"));
        return;
      }

      if(await _firebaseServices.isMobileExist(mobile)) {
        emit(SignupFailed("Sorry but mobile number is already been used"));
        return;
      }

      String resp = await _firebaseServices.createUserAccount(email, password, name, mobile);
      if(resp.isEmpty) {
        emit(SignupSuccess());
      } else {
        emit(SignupFailed(resp));
      }

    });
  }
}
