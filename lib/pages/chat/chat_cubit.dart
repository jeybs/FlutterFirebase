import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:flutter_firebase/models/message/message.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {

  late FirebaseServices _firebaseServices;

  ChatCubit() : super(ChatInitial()) {
    _firebaseServices = FirebaseServices();
  }

  loadProfile() {
    Future.delayed(const Duration(microseconds: 500), () async {
      UserData? userData = await _firebaseServices.getUserData();
      emit(UserProfileLoaded(userData));
    });
  }

  getMessages(String toId, String fromId, String roomId) {
    Future.delayed(const Duration(microseconds: 500), () async {
      bool hasChatted = await _firebaseServices.isUserAlreadyChat(toId, fromId);
      List<Message> messageList = [];
      if(hasChatted) {
        // had already chatted
        messageList = await _firebaseServices.getMessages(roomId);
      } else {
        // Not yet chatted
        // Create room
        String myRoomId = await _firebaseServices.createRoom(toId, fromId);
        await _firebaseServices.createRoom(fromId, toId);

        messageList = await _firebaseServices.getMessages(myRoomId);
      }

      emit(MessageLoaded(messageList));
    });
  }

  sendMessage(String message, String toId, String fromId, String myRoomid, String receiverRoomId) {
    Future.delayed(const Duration(microseconds: 500), () async {

      FieldValue fieldValue = FieldValue.serverTimestamp();

      // Create my message
      await _firebaseServices.createMessage(myRoomid, message, toId, fromId, fieldValue);

      // Create message to contact
      await _firebaseServices.createMessage(receiverRoomId, message, fromId, toId, fieldValue);

      //emit(UserProfileLoaded(userData));
    });
  }
}
