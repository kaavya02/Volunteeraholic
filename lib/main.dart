import 'package:flutter/material.dart';
import 'package:volunteeraholic/OrgLogin.dart';
import 'package:volunteeraholic/StudentLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StudentOrgScreen(),
    );
  }
}

class StudentOrgScreen extends StatefulWidget {
  @override
  _StudentOrgScreenState createState() => _StudentOrgScreenState();
}

class _StudentOrgScreenState extends State<StudentOrgScreen> {
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
                  "Login in as a",
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {return StudentLogin();}),
                );
              },
                  child: Text("Student")),
              Container(
                child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {return OrgLogin();}),
                  );
                },
                    child: Text("Organisation")),
              )
            ],
          ),
        ),
      ),
    );
  }
}



