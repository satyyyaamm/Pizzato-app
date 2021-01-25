import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/Cart/cart.dart';

int itemcounter = 0;
final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('User');
User user = FirebaseAuth.instance.currentUser;

class FloatingActionBtn extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          child: Icon(EvaIcons.shoppingBagOutline),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                  child: Cart(), type: PageTransitionType.bottomToTop),
            );
          },
        ),
        Positioned(
          left: 30,
          child: CircleAvatar(
            radius: 10,
            child: StreamBuilder(
              stream: collectionReference
                  .doc(user.uid)
                  .collection('Cart')
                  .snapshots(),
              builder: (context, snapshot) {
                int totalItems = 0;
                if (snapshot.connectionState == ConnectionState.active) {
                  List documents = snapshot.data.docs;
                  totalItems = documents.length;
                }
                return Text('$totalItems' ?? '0');
              },
            ),
          ),
        ),
      ],
    );
  }
}
