
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/contact_data/contact_data.dart';
import 'package:flutter_firebase/models/message/message.dart';
import 'package:flutter_firebase/models/message_room/message_room.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/utils/date_utils.dart';

class FirebaseServices {

  late FirebaseAuth authInstance;
  late FirebaseFirestore firestoreInstance;
  late Reference fireStorageRef;

  String _userCollection = "users";
  String _contactCollections = "contacts";
  String _messageCollections = "message";
  String _messageListcollection = "message_list";

  FirebaseServices() {
    authInstance = FirebaseAuth.instance;
    firestoreInstance = FirebaseFirestore.instance;
    fireStorageRef = FirebaseStorage.instance.ref();
  }

  String? getUserId() {
    return  authInstance.currentUser!.uid;
  }

  logout() async {
    await authInstance.signOut();
  }

  bool isUerLoggedIn() {
     User? userData = authInstance.currentUser;
     if(userData != null) {
       return true;
     }

     return false;
  }

  Future<String> createUserAccount(String email, String password, String name, String mobile) async {
    return authInstance.createUserWithEmailAndPassword(email: email, password: password).then((userCredentials) async {

      // Create user data on collection
      if(userCredentials.user != null) {
        final userCollection = firestoreInstance.collection(_userCollection).doc(userCredentials.user?.uid);

        Map<String, dynamic> userData = {
          'uid': userCredentials.user?.uid,
          'name': name.toUpperCase(),
          "email": email,
          'mobile': mobile,
          "photo": "",
          'date_added': FieldValue.serverTimestamp()
        };

        final _resp = await userCollection.set(userData).then((_) {
          return "";
        }).catchError((error) {
          return "Something went wrong";
        });

        return _resp;
      } else {
        return "Error creating account";
      }
    }).catchError((error) {
      print("errpr signup => ${error.message}");
      return error.message;
    });
  }

  Future<bool> isMobileExist(String mobile) async  {
    final snaphshot = await firestoreInstance.collection(_userCollection)
      .where('mobile', isEqualTo: mobile)
      .get();


    if(snaphshot.docs.isNotEmpty) {
      return true;
    }

    return false;


    // final userData = snaphshot.docs.map((e) => e).single;
    // print(userData.data());
  }

  Future<UserData?> getUserData() async {
    String uid = authInstance.currentUser!.uid;
    final snapshot = await firestoreInstance.collection(_userCollection).doc(uid).get(const GetOptions(source: Source.server));

    if(snapshot != null) {
      UserData userData = UserData.fromJson(snapshot.data() as Map<String, dynamic>);

      return userData;
    }

    return null;
  }

  Future<String> uploadImage(File pathFile, String imageName) async {
    try {
      final imagesRef = fireStorageRef.child("users/$imageName");
      await imagesRef.putFile(pathFile);

      return imagesRef.fullPath;
    } on FirebaseException catch (e) {
      print("Error Uploading => ${e.message}");
      return "";
    }
  }

  Future<bool> updateUserProfilePhoto(String newPath) async {
    String uid = authInstance.currentUser!.uid;
    final docRef = firestoreInstance.collection(_userCollection).doc(uid);
    final pathReference = fireStorageRef.child(newPath);
    final String imagePath = await pathReference.getDownloadURL();
    return docRef.update({"photo": imagePath}).then((value) {
      print("Success Update Photo");
      return true;
    }).catchError((error) {
      print("Error Update Photo => ${error.message}");
      return false;
    });
  }

  Future<List<Contact>> getUserContacts() async {
    String uid = authInstance.currentUser!.uid;
    final snapshot = await firestoreInstance.collection(_userCollection).doc(uid)
        .collection(_contactCollections)
        .get(const GetOptions(source: Source.server));

    List<Contact> contactList = [];
    if(snapshot.docs.isNotEmpty) {
      for(var snapshot in snapshot.docs) {
        Contact contact = Contact(
            userData: await searchUserByUid(snapshot.id),
            dateAdded: MyDateUtils.formatTimestamp(snapshot.data()['date_added']));

        contactList.add(contact);
      }
    }

    return contactList;
  }

  Future<UserData?> searchUser(String email) async {
    String uid = authInstance.currentUser!.uid;
    final snapshot = await firestoreInstance.collection(_userCollection)
        .where("email", isEqualTo: email)
        .get(const GetOptions(source: Source.server));

    if(snapshot.docs.isNotEmpty) {
      List<UserData?> userDataList = List<UserData>.from(snapshot.docs.map((userdoc) => UserData.fromJson(userdoc.data())).toList());
      if(userDataList.length > 0) {
        return userDataList[0];
      }
    }

    return null;
  }

  Future<UserData?> searchUserByUid(String userId) async {
    final snapshot = await firestoreInstance.collection(_userCollection)
        .where("uid", isEqualTo: userId)
        .get(const GetOptions(source: Source.server));

    if(snapshot.docs.isNotEmpty) {
      List<UserData?> userDataList = List<UserData>.from(snapshot.docs.map((userdoc) => UserData.fromJson(userdoc.data())).toList());
      if(userDataList.length > 0) {
        return userDataList[0];
      }
    }

    return null;
  }

  Future<bool> checkIfUserAdded(String contactId) async {
    String uid = authInstance.currentUser!.uid;
    final snapshot = await firestoreInstance.collection(_userCollection).doc(uid)
        .collection(_contactCollections)
        .where('from_id', isEqualTo: contactId)
        .get(const GetOptions(source: Source.server));

    print(snapshot.size);
    if(snapshot.docs.isNotEmpty) {

      return true;
    }

    return false;
  }
  
  Future<bool> saveContact(String contactId) async {
    String uid = authInstance.currentUser!.uid;
    final contactCollections = firestoreInstance.collection(_userCollection).doc("$uid").collection(_contactCollections).doc(contactId);

    return await contactCollections.set({'date_added': FieldValue.serverTimestamp()}).then((_) {
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }

  Future<void> createMessage(String roomId, String message, String toId, String fromId, FieldValue fieldValue) async {
    final messageCollection = firestoreInstance.collection(_messageCollections)
        .doc(roomId)
        .collection(_messageListcollection)
        .doc();

    await messageCollection.set({
      'message': message,
      'message_date': fieldValue,
      'from_id': fromId,
      'to_id': toId
    });

    final roomCollection = firestoreInstance.collection(_messageCollections)
        .doc(roomId);

    await roomCollection.update({
      'last_message': message,
      'last_message_date': fieldValue
    });
  }

  Future<bool> isUserAlreadyChat(String uid, String contactId) async {
    final fromMessage = await firestoreInstance.collection(_messageCollections)
        .where('from_id', isEqualTo: contactId)
        .where('to_id', isEqualTo: uid)
        .get(const GetOptions(source: Source.server));

    final toMessage = await firestoreInstance.collection(_messageCollections)
        .where('from_id', isEqualTo: uid)
        .where('to_id', isEqualTo: contactId)
        .get(const GetOptions(source: Source.server));

    // Check if already had conversation
    if(fromMessage.docs.isNotEmpty && toMessage.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> createRoom(String uid, String contactId) async {
    final contactCollections = firestoreInstance.collection(_messageCollections).doc();

    final res = await contactCollections.set({
      'last_message': "",
      'last_message_date': "",
      'from_id': uid,
      'to_id': contactId
    });

    return contactCollections.id;
  }

  Future<List<Message>> getMessages(String roomId) async {
    final collectionRef = await firestoreInstance.collection(_messageCollections)
        .doc(roomId)
        .collection(_messageListcollection)
        .get(const GetOptions(source: Source.server));

    List<Message> messageList = [];
    if(collectionRef.docs.isNotEmpty) {

      for(var docsData in collectionRef.docs) {
        Message message = Message(
          message: docsData.data()['message'],
          messageDate: docsData.data()['message_date'],
          fromId: docsData.data()['from_id'],
          toId: docsData.data()['to_id']);

        messageList.add(message);
      }
    }

    return messageList;
  }

  Future<List<MessageRoom>> getMyRooms() async {
    String uid = authInstance.currentUser!.uid;
    final roomCollections = await firestoreInstance.collection(_messageCollections)
        .where('to_id', isEqualTo: uid)
        .orderBy('last_message_date', descending: true)
        .get(const GetOptions(source: Source.server));

    List<MessageRoom> roomList = [];
    if(roomCollections.docs.isNotEmpty) {
      for(var docsData in roomCollections.docs) {
        MessageRoom room = MessageRoom(
          userData: await searchUserByUid(docsData.data()['from_id']),
          lastMessage: docsData.data()['last_message'],
          lastMessageDate: docsData.data()['last_message_date'] != "" ? MyDateUtils.formatTimestamp(docsData.data()['last_message_date']) : "",
          toId: docsData.data()['to_id'],
          roomId: docsData.id,
          receiverRoomId: await getReceiverRoomId(docsData.data()['from_id'], docsData.data()['to_id'])
        );
        
        roomList.add(room);
      }
    }

    return roomList;
  }

  Future<String> getReceiverRoomId(String fromId, String toId)async {
    final receiverRoomCollection = await firestoreInstance.collection(_messageCollections)
        .where('from_id', isEqualTo: toId)
        .where('to_id', isEqualTo: fromId)
        .get(const GetOptions(source: Source.server));

    if(receiverRoomCollection.docs.isNotEmpty) {
      return receiverRoomCollection.docs[0].id;
    }

    return "";
  }
}