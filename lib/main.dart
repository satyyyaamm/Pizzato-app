import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzato_app/helpers/header/header.dart';
import 'package:pizzato_app/helpers/middler.dart';
import 'package:pizzato_app/helpers/tail.dart';
import 'package:pizzato_app/screens/splash_screen/splash_screen.dart';
import 'package:pizzato_app/services/Authentication.dart';
import 'package:pizzato_app/services/Calculations.dart';
import 'package:pizzato_app/services/manage_data.dart';
import 'package:pizzato_app/services/Genratemaps.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Calculations()),
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: Header()),
        ChangeNotifierProvider.value(value: Middler()),
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Tail()),
        ChangeNotifierProvider.value(value: GenerateMaps()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pizzato',
        theme: ThemeData(
          textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.amber,
          primaryColor: Color(0xFFFFC46B),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
