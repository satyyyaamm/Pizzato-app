import 'package:flutter/material.dart';
import 'package:pizzato_app/helpers/floating_Action_Button.dart';
import 'package:pizzato_app/helpers/header/header.dart';
import 'package:pizzato_app/helpers/middler.dart';
import 'package:pizzato_app/helpers/tail.dart';
import 'package:pizzato_app/services/Genratemaps.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBtn().floatingActionButton(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header().appBar(context),
            Header().headingText(),
            Header().headerOptions(context),
            Middler().middleText(),
            Middler().favData(context, 'Favourite'),
            Tail().tailtext(),
            Tail().businessData(context, 'Business'),
          ],
        ),
      ),
    );
  }
}
