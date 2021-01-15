import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends ChangeNotifier {
  String uid;
  String get getUid => uid;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginIntoAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    uid = user.uid;
    print('This is our uid $getUid');
    ChangeNotifier();
  }

  Future createAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    uid = user.uid;
    print('This is our uid $getUid');
    ChangeNotifier();
  }

  Future signOut() async {
    await firebaseAuth.signOut();
    ChangeNotifier();
  }
}
