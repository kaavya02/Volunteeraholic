import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/SignUp.dart';
import 'package:volunteeraholic/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/OrgLogin.dart';
import 'package:volunteeraholic/StudentLogin.dart';


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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xfb43bccd, color),
        primaryColor: darkGreen,
        backgroundColor: white,
        fontFamily: 'Open Sans'
      ),
      home: StudentOrgScreen(),
    );
  }
}

class StudentOrgScreen extends StatefulWidget {
  @override
  _StudentOrgScreenState createState() => _StudentOrgScreenState();
}

class _StudentOrgScreenState extends State<StudentOrgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
                'Sign In',
                style: TextStyle(fontSize: 28)),
            SizedBox(height: 25),
            Container(
              width: 225,
              height: 225,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/images/logo.png'))
              ),
            ),
            SizedBox(height: 100),
            SizedBox(
              height: 42,
              width: 315,
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {return StudentLogin();}),);},
                child: Text("Student", style: TextStyle(color: white, fontSize: 18.5)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                Expanded(child: Container(height: 2,color: Colors.grey.shade400)),
                SizedBox(width: 13),
                Text('OR'),
                SizedBox(width: 13),
                Expanded(child: Container(height: 2,color: Colors.grey.shade400)),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 42,
              width: 300,
              child: OutlinedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {return OrgLogin();}),
                );
              },
                child: Text("Organisation", style: TextStyle(color: light, fontSize: 18.5)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(
                              color: Colors.blue,
                              width: 100.0,
                              style: BorderStyle.solid)
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not registered yet?"),
                TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {return SignUp();}),
                  );
                }, child: Text("Sign up"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}






