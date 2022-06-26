import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/HomeScreen.dart';

import 'auth_service.dart';

class OrgLogin extends StatefulWidget {
  const OrgLogin({ Key ? key }) : super (key: key);

  @override
  _OrgLoginState createState() => _OrgLoginState();
}
class _OrgLoginState extends State<OrgLogin> {
  @override
  Widget build (BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold (
        backgroundColor : Colors.white ,
        appBar : AppBar (
        title : const Text ("Google Login"),
        backgroundColor : darkGreen ,
        ),
      body: Container(
        width : size.width,
        height : size.height,
        padding: EdgeInsets.only(
            left: 20, right: 20, top: size.height * 0.1, bottom: size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Hello, \nsign in using Organisation's email",
              style: TextStyle(
                  fontSize: 30
        )),
        SizedBox(height: 40,),
        GestureDetector(
        onTap: () {
          AuthService().signInWithGoogle();
        },
        child: const Image(width: 100, height: 30, image: AssetImage('assets/images/google.png'))),
        ],
        ),
        ),
        );
        }
    }
