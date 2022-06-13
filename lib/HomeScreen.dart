import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
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
      appBar: AppBar(title: Text('Home Screen'),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome!', style: TextStyle(fontSize: 30),),
              SizedBox(height: 50,),
              SizedBox(
                height: 62,
                width: 365,
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
                  child: Text('Logout', style: TextStyle(fontSize: 20, color: white)),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )
                      )
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
