import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/helpers/header/food_options.dart';
import 'package:pizzato_app/screens/Maps/maps.dart';
import 'package:pizzato_app/services/Genratemaps.dart';
import 'package:provider/provider.dart';

class Header extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 5, right: 5, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.grey),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: Maps(), type: PageTransitionType.bottomToTop),
                  );
                },
                child: Container(
                  constraints: BoxConstraints(maxWidth: 220),
                  child: Text(
                    Provider.of<GenerateMaps>(context, listen: false)
                        .finalAddress,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
    );
  }

  Widget headingText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What would you like',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 29),
          ),
          Text(
            'to eat?',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 45),
          ),
        ],
      ),
    );
  }

  Widget headerOptions(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
        child: Row(
          children: [
            FoodOptions(
                text: 'All Food',
                color: Colors.amber.shade200,
                backgroundColor: Colors.amber.shade100,
                onpressed: () {}),
            SizedBox(width: 25),
            FoodOptions(
                text: 'Sandwich',
                color: Colors.grey.shade100,
                backgroundColor: Colors.grey.shade200,
                onpressed: () {}),
            SizedBox(width: 25),
            FoodOptions(
                text: 'Pasta',
                color: Colors.grey.shade100,
                backgroundColor: Colors.grey.shade200,
                onpressed: () {}),
            SizedBox(width: 25),
            FoodOptions(
                text: 'Burger',
                color: Colors.grey.shade100,
                backgroundColor: Colors.grey.shade200,
                onpressed: () {}),
          ],
        ),
      ),
    );
  }
}
