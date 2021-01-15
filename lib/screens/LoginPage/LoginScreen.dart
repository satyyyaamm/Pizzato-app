import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_app/screens/Cart/location_button.dart';
import 'package:pizzato_app/screens/LoginPage/CustomInput.dart';
import 'package:pizzato_app/screens/SignInPage/signInPage.dart';
import 'package:pizzato_app/screens/detail_screen/add_btn.dart';
import 'package:pizzato_app/screens/home_screen/home_screen.dart';
import 'package:pizzato_app/screens/splash_screen/headingText.dart';
import 'package:pizzato_app/services/Authentication.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void loginsubmit() {
    
    Provider.of<Authentication>(context, listen: false)
        .loginIntoAccount(emailController.text, passwordController.text)
        .whenComplete(
          () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: HomeScreen(), type: PageTransitionType.bottomToTop),
          ),
        );
    
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeadingText(),
            CustomInput(
              controller: emailController,
              hinttext: 'Email',
              obscuretext: false,
              textInputAction: TextInputAction.next,
            ),
            CustomInput(
              controller: passwordController,
              hinttext: 'Password',
              obscuretext: true,
              textInputAction: TextInputAction.done,
              onsubmitted: (val) {
                loginsubmit();
              },
            ),
            AddBtn(
              text: 'Login',
              onpressed: () {
                loginsubmit();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: LocationButton(
                text: 'Dont have an Account ? Click',
                onpressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: SignInPage(),
                        type: PageTransitionType.leftToRight),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
