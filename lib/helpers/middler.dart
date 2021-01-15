import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/detail_screen/detail_screen.dart';
import 'package:pizzato_app/services/manage_data.dart';
import 'package:provider/provider.dart';

class Middler extends ChangeNotifier {
  Widget middleText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text(
            'Favourite',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 40),
          ),
          SizedBox(width: 5),
          Text(
            'dishes',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 25),
          ),
        ],
      ),
    );
  }

  Widget favData(BuildContext context, String collection) {
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
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: DetailScreen(
                            queryDocumentSnapshot: snapshot.data[index]),
                        type: PageTransitionType.rightToLeftWithFade),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 250,
                    width: 200,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: 180,
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
                                child: Image.network(
                                    snapshot.data[index].data()['image'],
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              left: 150,
                              child: IconButton(
                                icon: Icon(EvaIcons.heart, color: Colors.red),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            snapshot.data[index].data()['name'],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            snapshot.data[index].data()['category'],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(EvaIcons.star, color: Colors.amber),
                            ),
                            Text(
                              snapshot.data[index].data()['rating'],
                              style: TextStyle(fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 95),
                              child: Text(
                                '₹${snapshot.data[index].data()['price']}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
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
