import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/detail_screen/detail_screen.dart';
import 'package:pizzato_app/services/manage_data.dart';
import 'package:provider/provider.dart';

class Tail extends ChangeNotifier {
  Widget tailtext() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Text(
        'Business Lunch',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 40),
      ),
    );
  }

  Widget businessData(BuildContext context, String collection) {
    return Container(
      height: 300,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: DetailScreen(
                            queryDocumentSnapshot: snapshot.data[index],
                          ),
                          type: PageTransitionType.rightToLeftWithFade),
                    );
                  },
                  child: Container(
                    height: 160,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),
                              height: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                    snapshot.data[index].data()['image'],
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data[index].data()['name'],
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              Text(
                                snapshot.data[index].data()['category'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '₹${snapshot.data[index].data()['notPrice']}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.amber.shade300),
                              ),
                              Text(
                                '₹${snapshot.data[index].data()['price']}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
