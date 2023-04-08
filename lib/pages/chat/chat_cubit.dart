import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/data/firebase/firebase_services.dart';
import 'package:flutter_firebase/models/message/message.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/utils/date_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {

  late FirebaseServices _firebaseServices;
  late StreamSubscription streamSubscription;

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

      print("Message Length => ${messageList.length}");
      emit(MessageLoaded(messageList));
    });
  }

  sendMessage(String message, String fromId, String toId, String myRoomid, String receiverRoomId, XFile? attachment) {
    Future.delayed(const Duration(microseconds: 500), () async {

      FieldValue fieldValue = FieldValue.serverTimestamp();

      String attachmentLink = "";
      if(attachment != null) {
        String _newImageName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
        String dir = path.dirname(attachment.path);
        String newName = path.join(dir, _newImageName);
        File newFile = File(attachment.path).renameSync(newName);

        String response = await _firebaseServices.uploadAttachment(newFile, _newImageName);
        if(!response.isNotEmpty) {
          emit(UploadFailed("Failed to upload. try again"));
          return;
        }

        attachmentLink = response;
      }

      // Create my message
      await _firebaseServices.createMessage(myRoomid, message, fromId, toId, fieldValue, attachmentLink);
      await _firebaseServices.markRoomAsRead(myRoomid, true);

      // Create message to contact
      await _firebaseServices.createMessage(receiverRoomId, message, fromId, toId, fieldValue, attachmentLink);
      await _firebaseServices.markRoomAsRead(receiverRoomId, false);

      if(attachment != null) {
        if(attachmentLink.isNotEmpty) {
          emit(UploadSuccess());
        }
      } else {
        emit(MessageSent());
      }


    });
  }

  listenToMessageUpdate(String roomId) {

    streamSubscription = _firebaseServices.startMessageListening(roomId).listen((event) async {
      if(event.size > 0) {
        List<Message> messageList = [];
        for(var docsData in event.docs) {
          if(docsData.data().isNotEmpty != null) {
            Message message = Message(
                message: docsData.data()['message'],
                attachment: docsData.data()['attachment'] != null ? docsData.data()['attachment'] : "",
                messageDate: MyDateUtils.formatTimeStampToDateTime(docsData.data()['message_date']),
                fromId: docsData.data()['from_id'],
                toId: docsData.data()['to_id']);

            messageList.add(message);
          }
        }

        await _firebaseServices.markRoomAsRead(roomId, true);

        emit(NewMessageUpdate(messageList));
      }
    });
  }

  cancelToListenMessageUpdate() {
    streamSubscription.cancel();
  }
}
