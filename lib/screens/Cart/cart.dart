import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/Cart/location_button.dart';
import 'package:pizzato_app/screens/Maps/maps.dart';
import 'package:pizzato_app/screens/detail_screen/add_btn.dart';
import 'package:pizzato_app/screens/detail_screen/circle_backgroundBtn.dart';
import 'package:pizzato_app/screens/detail_screen/detail_screen.dart';
import 'package:pizzato_app/services/Genratemaps.dart';
import 'package:pizzato_app/services/manage_data.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot1;

  const Cart({Key key, this.queryDocumentSnapshot1}) : super(key: key);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your',
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Cart',
                  style: const TextStyle(
                      fontSize: 44,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 280,
                  child: FutureBuilder(
                    future: Provider.of<ManageData>(context, listen: false)
                        .fetchDataForCart("User"),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Lottie.asset('assets/loading.json'),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    child: DetailScreen(
                                      queryDocumentSnapshot:
                                          snapshot.data[index],
                                    ),
                                    type: PageTransitionType.topToBottom),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.network(
                                              snapshot.data[index]
                                                  .data()['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 150,
                                                  ),
                                                  child: Text(
                                                    snapshot.data[index]
                                                        .data()['name'],
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    child: Text(
                                                      '${snapshot.data[index].data()['cheese']}x Cheese',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    child: Text(
                                                      '${snapshot.data[index].data()['paneer']}x Paneer',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    child: Text(
                                                      '${snapshot.data[index].data()['beacon']}x Beacon',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {}),
                                          SizedBox(height: 29),
                                          Container(
                                            child: Text(
                                              '₹ ${snapshot.data[index].data()['price']}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 168,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            spreadRadius: 5,
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: LocationButton(
                            onpressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    child: Maps(),
                                    type:
                                        PageTransitionType.leftToRightWithFade),
                              );
                            },
                            text: Provider.of<GenerateMaps>(context,
                                    listen: false)
                                .getMainAddress,
                            icon: Icon(Icons.location_on_outlined),
                            icon2: Icon(Icons.edit),
                          ),
                        ),
                        LocationButton(
                          onpressed: () {},
                          text: '20-30 mins asap',
                          icon: Icon(Icons.timelapse_outlined),
                          icon2: Icon(Icons.edit),
                        ),
                        LocationButton(
                          onpressed: () {},
                          text: 'Cash',
                          icon: Icon(Icons.money_outlined),
                          icon2: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
                  child: FutureBuilder(
                    future: Provider.of<ManageData>(context, listen: false)
                        .fetchDataForCart('User'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                Text(
                                  '₹${snapshot.data['price']}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery charges',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                  Text(
                                    '₹40',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '₹240',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddBtn(onpressed: () {}, text: 'Place order'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
