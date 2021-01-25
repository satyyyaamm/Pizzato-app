import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/LoginPage/LoginScreen.dart';
import 'package:pizzato_app/screens/home_screen/home_screen.dart';
import 'package:pizzato_app/screens/splash_screen/headingText.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userUid;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getuid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userUid = sharedPreferences.getString('uid');
  }

  @override
  void initState() {
    getuid().whenComplete(
      () => Timer(
        Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
            context,
            PageTransition(
                child: userUid == null ? LoginScreen() : HomeScreen(),
                type: PageTransitionType.rightToLeft),
          );
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 400,
              child: Lottie.asset('assets/slice.json'),
            ),
            HeadingText(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          ],
        ),
      ),
    );
  }
}
