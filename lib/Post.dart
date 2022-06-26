
import 'dart:js_util/js_util_wasm.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final orgName =  TextEditingController();
  final description = TextEditingController();
  final volunteerRequirements = TextEditingController();
  final commitmentPeriod = TextEditingController();
  final volunteerRewards = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Creat a Post'),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
            Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: orgName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name of Organisation',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: description,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: volunteerRequirements,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Volunteer requirements',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: commitmentPeriod,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Commitment Period',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: volunteerRewards,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Rewards for volunteers',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: 365,
                child: ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                },
                  child: Text("Upload Post", style: TextStyle(fontSize: 20, color: white),),
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
      )
    );

    Future createPost({
      required String orgName,
      required String description,
      required String volunteerRequirements,
      required String commitmentPeriod,
      required String  volunteerRewards}) async {

      final docPost = FirebaseFirestore.instance.collection('posts').doc();

      final jsonPost = Post(
          orgName: orgName,
          volunteerRequirements: volunteerRequirements,
          commitment: commitmentPeriod,
          description: description,
          volunteerRewards: volunteerRewards);
    }
  }
}


class Post {
  final String id;
  final String orgName;
  final String description;
  final String volunteerRequirements;
  final String commitment;
  final String volunteerRewards;

  Post({
    this.id = '',
    required this.orgName,
    required this.volunteerRequirements,
    required this.commitment,
    required this.description,
    required this.volunteerRewards,
});
}