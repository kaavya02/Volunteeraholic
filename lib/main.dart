import 'package:google_sign_in/google_sign_in.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/HomeScreen.dart';
import 'package:volunteeraholic/auth_service.dart';
import 'package:volunteeraholic/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

Map<int, Color> color =
{
  50:Color.fromRGBO(67,188,205, .1),
  100:Color.fromRGBO(67,188,205, .2),
  200:Color.fromRGBO(67,188,205, .3),
  300:Color.fromRGBO(67,188,205, .4),
  400:Color.fromRGBO(67,188,205, .5),
  500:Color.fromRGBO(67,188,205, .6),
  600:Color.fromRGBO(67,188,205, .7),
  700:Color.fromRGBO(67,188,205, .8),
  800:Color.fromRGBO(67,188,205, .9),
  900:Color.fromRGBO(67,188,205, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xfb255957, color),
          primaryColor: darkGreen,
          backgroundColor: white,
          fontFamily: 'Open Sans'
      ),
      home: AuthService().handleAuthState(),
    );
  }
}








