import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/Cart/cart.dart';

class FloatingActionBtn extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(EvaIcons.shoppingBagOutline),
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(child: Cart(), type: PageTransitionType.bottomToTop),
        );
      },
    );
  }
}
