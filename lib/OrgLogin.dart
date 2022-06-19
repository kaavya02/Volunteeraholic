import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/HomeScreen.dart';

class OrgLogin extends StatefulWidget {
  const OrgLogin({Key? key}) : super(key: key);

  @override
  State<OrgLogin> createState() => _OrgLoginState();
}

class _OrgLoginState extends State<OrgLogin> {
  final emailController =  TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Your Organisation'),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Please enter the registered NUS emailID and password of the organisation",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'NUS emailID',
                ),
                controller: emailController,
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                controller: passwordController,
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
                  child: Text("Login"),
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