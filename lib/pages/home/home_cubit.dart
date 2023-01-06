import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:flutter_firebase/models/user_data.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  late FirebaseServices _firebaseServices;

  HomeCubit() : super(HomeInitial()) {
    _firebaseServices = FirebaseServices();
  }

  loadProfile() {
    Future.delayed(Duration(microseconds: 500), () async {
      UserData? userData = await _firebaseServices.getUserData();
      print("UserData => ${userData!.toMap()}");
      emit(UserProfileLoaded(userData));
    });
  }

  logout() {
    Future.delayed(Duration(microseconds: 500), () async {
      await _firebaseServices.logout();
      emit(UserLogout());
    });
  }
}
