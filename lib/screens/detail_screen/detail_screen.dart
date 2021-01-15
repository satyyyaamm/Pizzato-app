import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/Cart/cart.dart';
import 'package:pizzato_app/screens/detail_screen/add_btn.dart';
import 'package:pizzato_app/screens/detail_screen/circle_backgroundBtn.dart';
import 'package:pizzato_app/screens/detail_screen/pizza_Size.dart';
import 'package:pizzato_app/screens/detail_screen/toppings_Btn.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;

  const DetailScreen({Key key, this.queryDocumentSnapshot}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int cheeseValue = 0;
  int chickenValue = 0;
  int beconValue = 0;
  int paneerValue = 0;
  int veggiesValue = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    List pizzaSize = widget.queryDocumentSnapshot.data()['size'];
    return Scaffold(
      key: key,
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 350,
                        child: Image.network(
                          widget.queryDocumentSnapshot.data()['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Icon(EvaIcons.star, color: Colors.amber, size: 15),
                            SizedBox(width: 10),
                            Container(
                              child: Text(
                                widget.queryDocumentSnapshot.data()['rating'],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              child: Text(
                                widget.queryDocumentSnapshot.data()['name'],
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              child: Text(
                                "₹${widget.queryDocumentSnapshot.data()['notPrice']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              child: Text(
                                widget.queryDocumentSnapshot.data()['category'],
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              child: Text(
                                "₹${widget.queryDocumentSnapshot.data()['price']}",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 470),
                    child: Container(
                      height: 570,
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 10,
                              spreadRadius: 5,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add more stuff',
                              style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            ToppingBtn(
                                toppingsValue: cheeseValue, text: 'Cheese'),
                            ToppingBtn(
                                toppingsValue: chickenValue, text: 'Chicken'),
                            ToppingBtn(
                                toppingsValue: beconValue, text: 'Becon'),
                            ToppingBtn(
                                toppingsValue: paneerValue, text: 'Paneer'),
                            ToppingBtn(
                                toppingsValue: veggiesValue, text: 'Veggies'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PizzaSize(pizzaSize: pizzaSize),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 295,
            child: CircleBackgroundBtn(
              icon: Icon(Icons.close),
              onpressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 680),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AddBtn(
                    onpressed: () {
                      FirebaseFirestore.instance.collection('Cart').add({
                        'image': widget.queryDocumentSnapshot.data()['image'],
                        'name': widget.queryDocumentSnapshot.data()['name'],
                        'price': widget.queryDocumentSnapshot.data()['price'],
                        'notPrice':
                            widget.queryDocumentSnapshot.data()['notPrice'],
                        'rating': widget.queryDocumentSnapshot.data()['rating'],
                        'size': widget.queryDocumentSnapshot.data()['size'],
                        'category':
                            widget.queryDocumentSnapshot.data()['category']
                      }).whenComplete(
                        () => key.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added to Cart',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ),
                            padding: EdgeInsets.all(10),
                            duration: Duration(seconds: 3),
                            backgroundColor: Color(0xFFFFC46B),
                            shape: StadiumBorder(),
                          ),
                        ),
                      );
                    },
                    text: 'Add to cart'),
                CircleBackgroundBtn(
                  icon: Icon(EvaIcons.shoppingBagOutline),
                  onpressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: Cart(), type: PageTransitionType.bottomToTop),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
