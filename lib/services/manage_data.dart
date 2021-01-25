import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageData extends ChangeNotifier {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final User user = FirebaseAuth.instance.currentUser;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('User');

  Future fetchData(String collection) async {
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future fetchDataForCart(String collection) async {
    QuerySnapshot snapshot = await firebaseFirestore
        .collection(collection)
        .doc(user.uid)
        .collection('Cart')
        .get();
    return snapshot.docs;
  }
}
