import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/HomeScreen.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final emailController =  TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Please enter your NUS email and password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15)),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'NUS emailID',
                ),
                controller: emailController,
              ),
              SizedBox(height: 20),
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  controller: passwordController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 62,
                width: 365,
                child: ElevatedButton(onPressed: () {
                  FirebaseAuth
                      .instance
                      .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                      .then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {return HomeScreen();}),
                  ),
                  );
                },
                  child: Text("Login", style: TextStyle(fontSize: 20, color: white),),
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
      ),
    );
  }
}