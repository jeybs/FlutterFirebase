import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/message_room/message_room.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/utils/date_utils.dart';
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

  searchUserByEmail(String email) async {
    UserData? userData = await _firebaseServices.searchUser(email);
    emit(SearchUserData(userData));
  }

  getContactList() {
    Future.delayed(const Duration(microseconds: 500), () async {
      List<Contact> contactList = await _firebaseServices.getUserContacts();
      emit(ContactListLoaded(contactList));
    });
  }

  getRooms() {
    Future.delayed(const Duration(microseconds: 500), () async {
      _firebaseServices.getMyRooms().listen((event) async {
        List<MessageRoom> roomList = [];
        if(event.size > 0) {

          for(var docsData in event.docs) {
            //if(docsData.data()['message_date'] != null) {
              MessageRoom room = MessageRoom(
                  userData: await _firebaseServices.searchUserByUid(docsData.data()['from_id']),
                  lastMessage: docsData.data()['last_message'],
                  attachment: docsData.data()['attachment'] != null ? docsData.data()['attachment'] : "",
                  lastMessageDate: docsData.data()['last_message_date'] != null ? MyDateUtils.formatTimestamp(docsData.data()['last_message_date']) : "",
                  toId: docsData.data()['to_id'],
                  roomId: docsData.id,
                  receiverRoomId: await _firebaseServices.getRoomId(docsData.data()['from_id'], docsData.data()['to_id']),
                  isRead: docsData.data()['is_read']
              );

              roomList.add(room);
            //}

          }

          emit(RoomsLoaded(roomList));
        }
      });
    });
  }
}
