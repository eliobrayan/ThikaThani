import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

class LoginController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await Firebase.initializeApp();
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result.user.uid);
      return result.user != null;
    } catch (e) {
      print("hola");
    }
  }

  Future<bool> singUp(String email, String password) async {
    try {
      print("go");
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }
}
