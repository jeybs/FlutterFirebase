
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user_data.dart';

class FirebaseServices {

  late FirebaseAuth authInstance;
  late FirebaseFirestore firestoreInstance;

  String _userCollection = "users";

  FirebaseServices() {
    authInstance = FirebaseAuth.instance;
    firestoreInstance = FirebaseFirestore.instance;
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
          'name': name.toUpperCase(),
          'mobile': mobile,
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
    final snapshot = firestoreInstance.collection(_userCollection).doc(uid).snapshots();

    if(await snapshot.isEmpty == false) {
      final userSnapshot = await snapshot.first;
      UserData userData = UserData.fromMap(userSnapshot.data()!);

      return userData;
    }

    return null;
  }
}