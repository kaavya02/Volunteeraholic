import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';

class Post {
  String id;
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

  Map<String, dynamic> toJson() => {
    'id' : id,
    'orgName': orgName,
    'volunteerRequirements': volunteerRequirements,
    'commitment' : commitment,
    'description': description,
    'volunteerRewards' : volunteerRewards
  };

  static Post fromJson(Map<String, dynamic> json) => Post(
      orgName: json['orgName'],
      volunteerRequirements: json['volunteerRequirements'],
      commitment: json['commitment'],
      description: json['description'],
      volunteerRewards: json['volunteerRewards']);
}

Future createPost(Post post) async {

  final docPost =  FirebaseFirestore.instance.collection('posts').doc();
  post.id = docPost.id;

  final json = post.toJson();

  await docPost.set(json);
}

Stream<List<Post>> readPosts() => FirebaseFirestore
    .instance
    .collection('posts')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((post) => Post.fromJson(post.data())).toList())
    ;

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
                  final post = Post(
                      orgName: orgName.text,
                      volunteerRequirements: volunteerRequirements.text,
                      commitment: commitmentPeriod.text,
                      description: description.text,
                      volunteerRewards: volunteerRewards.text
                  );
                  
                  createPost(post);

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
  }
}




