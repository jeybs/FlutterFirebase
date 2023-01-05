
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {

  late FirebaseAuth authInstance;
  late FirebaseFirestore firestoreInstance;

  String _userCollection = "users";

  FirebaseServices() {
    authInstance = FirebaseAuth.instance;
    firestoreInstance = FirebaseFirestore.instance;
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

    if(snaphshot.docs.length > 0) {
      return true;
    }

    return false;


    // final userData = snaphshot.docs.map((e) => e).single;
    // print(userData.data());
  }
}