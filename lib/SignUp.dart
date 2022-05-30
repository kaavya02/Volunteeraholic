import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
              child: Image.asset("assets/images/blob2.png"),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 30),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
                SizedBox(width: 30)
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'NUS emailID',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: passwordController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Confirm Password',
              ),
            ),


            ElevatedButton(onPressed: () {
              FirebaseAuth
                  .instance
                  .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                  .then((value) => Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {return HomeScreen();}),
              ),
                  );
            }, child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
