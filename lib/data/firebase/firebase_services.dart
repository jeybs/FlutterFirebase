
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/contact_data/contact_data.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/utils/date_utils.dart';

class FirebaseServices {

  late FirebaseAuth authInstance;
  late FirebaseFirestore firestoreInstance;
  late Reference fireStorageRef;

  String _userCollection = "users";
  String _contactCollections = "contacts";
  String _messageCollections = "";

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
}