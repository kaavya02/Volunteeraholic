import 'package:volunteeraholic/OrgLogin.dart';
import 'package:volunteeraholic/StudentLogin.dart';
import 'package:volunteeraholic/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';

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
            SizedBox(height: 50),
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