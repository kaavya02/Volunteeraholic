import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/NavBar.dart';
import 'package:volunteeraholic/StudentOrgScreen.dart';

import 'auth_service.dart';

var loggedIn = (FirebaseAuth.instance.currentUser == null) ? (false) : (true);
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      drawer: NavBar(),
      body:
        Text(
         ('Welcome') ,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
      );
  }
}