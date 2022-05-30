import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/HomeScreen.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final emailController =  TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/blob2.png", height: 350, width: 400),
            ),
            SizedBox(height: 30),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'NUS emailID',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                obscureText: true,
                controller: passwordController2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Confirm Password',
                ),
              ),
            ),
              SizedBox(height: 20),
              SizedBox(
                height:50, width: 355,
                child: ElevatedButton(onPressed: () {
                FirebaseAuth
                    .instance
                    .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                    .then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {return HomeScreen();}),
                ),
                    );
            }, child: Text('Sign Up', style: TextStyle(fontSize: 17, color: white),),
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
              )
          ],
        ),
      ),
    );
  }
}
