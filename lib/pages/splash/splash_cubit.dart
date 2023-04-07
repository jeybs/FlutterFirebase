import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  late FirebaseServices _firebaseServices;

  SplashCubit() : super(SplashInitial()) {
    _firebaseServices = FirebaseServices();
  }

  checkIfLoggedIn() {
    print(_firebaseServices.isUerLoggedIn());
    Future.delayed(const Duration(seconds: 1), () {
      emit(IsUserLoggedIn(_firebaseServices.isUerLoggedIn()));
    });
  }
}
