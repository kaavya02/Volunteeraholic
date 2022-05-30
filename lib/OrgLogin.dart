import 'package:flutter/material.dart';
import 'package:volunteeraholic/HomeScreen.dart';

class OrgLogin extends StatefulWidget {
  const OrgLogin({Key? key}) : super(key: key);

  @override
  State<OrgLogin> createState() => _OrgLoginState();
}

class _OrgLoginState extends State<OrgLogin> {
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
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {return HomeScreen();}),
                );
              }, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}