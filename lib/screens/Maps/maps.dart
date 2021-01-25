import 'package:flutter/material.dart';
import 'package:pizzato_app/screens/detail_screen/circle_backgroundBtn.dart';
import 'package:pizzato_app/services/Genratemaps.dart';
import 'package:provider/provider.dart';

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Stack(
          children: [
            Provider.of<GenerateMaps>(context, listen: false).fetchLocation(),
            Positioned(
              top: 20,
              right: 295,
              child: CircleBackgroundBtn(
                icon: Icon(Icons.close),
                onpressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
