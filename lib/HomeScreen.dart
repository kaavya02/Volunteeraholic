import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child:
          SizedBox(
            height: 42,
            width: 315,
            child: ElevatedButton(onPressed: () {
              FirebaseAuth
                  .instance
                  .signOut()
                  .then((value) =>
                Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return StudentOrgScreen();
                }
                ),
              )
            );
            },
              child: Text('Logout'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )
                  )
              ),
            ),
          ),
      ),
    );
  }
}
