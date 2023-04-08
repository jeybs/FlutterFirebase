import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:meta/meta.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {

  late FirebaseServices _firebaseServices;

  UserInfoCubit() : super(UserInfoInitial()) {
    _firebaseServices = FirebaseServices();
  }

  loadProfile() {
    Future.delayed(Duration(microseconds: 500), () async {
      UserData? userData = await _firebaseServices.getUserData();
      emit(UserProfileLoaded(userData));
    });
  }

  checkIfAlreadyAdded(String uid) {
    Future.delayed(const Duration(microseconds: 500), () async {
      bool isAdded = await _firebaseServices.checkIfUserAdded(uid);
      emit(IsUserAreadyAdded(isAdded));
    });
  }

  saveUserContact(UserData userData) {
    Future.delayed(const Duration(seconds: 1), () async {
      bool isSave = await _firebaseServices.saveContact(userData.uid);
      emit(UserAdded(isSave));

    });
  }
}
