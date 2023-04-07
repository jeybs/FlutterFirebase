import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:flutter_firebase/models/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

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
      emit(const UserLogout());
    });
  }

  String? getUserId() {
    return _firebaseServices.getUserId();
  }

  uploadUserImage(XFile imageSelected) async {
    print("Path => ${imageSelected.path}");

    String? uid = _firebaseServices.getUserId();

    String _newImageName = "${uid}.jpg";
    String dir = path.dirname(imageSelected.path);
    String newName = path.join(dir, _newImageName);
    File newFile = File(imageSelected.path).renameSync(newName);

    String response = await _firebaseServices.uploadImage(newFile, _newImageName);
    if(response.isNotEmpty) {
      emit(UploadImageSuccess(response));
    } else {
      emit(UploadImageFail());
    }
  }

  updateUserProfilePhoto(String newPath) async {
    bool updateRespose = await _firebaseServices.updateUserProfilePhoto(newPath);
    if(updateRespose) {
      emit(UpdateUserProfilePhotoSuccess());
    } else {
      emit(UpdateUserProfilePhotoFail());
    }
  }

  searchUserByEmail(String email) {
    _firebaseServices.searchUser(email);
  }
}
