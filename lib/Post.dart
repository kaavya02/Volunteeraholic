
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';

class Post {
  String id;
  final String eventName;
  final String imageURL;
  final String orgName;
  final String description;
  final String volunteerRequirements;
  final DateTime startDate;
  final String commitment;
  final String volunteerRewards;
  final String linkToSignUp;

  Post({
    this.id = '',
    required this.eventName,
    required this.imageURL,
    required this.orgName,
    required this.volunteerRequirements,
    required this.startDate,
    required this.commitment,
    required this.description,
    required this.volunteerRewards,
    required this.linkToSignUp
  });

  Map<String, dynamic> toJson() => {
    'id' : id,
    'eventName' : eventName,
    'image': imageURL,
    'orgName': orgName,
    'volunteerRequirements': volunteerRequirements,
    'startDate' : startDate,
    'commitment' : commitment,
    'description': description,
    'volunteerRewards' : volunteerRewards,
    'linkToSignUP' : linkToSignUp
  };

  static Post fromJson(Map<String, dynamic> json) => Post(
      eventName: json['eventName'],
      imageURL: json['imageURL'],
      orgName: json['orgName'],
      volunteerRequirements: json['volunteerRequirements'],
      startDate: json['startDate'],
      commitment: json['commitment'],
      description: json['description'],
      volunteerRewards: json['volunteerRewards'],
      linkToSignUp: json['linkToSignUp']);
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
  final eventName = TextEditingController();
  final imageURL = TextEditingController();
  final orgName =  TextEditingController();
  final description = TextEditingController();
  final volunteerRequirements = TextEditingController();
  final commitmentPeriod = TextEditingController();
  final volunteerRewards = TextEditingController();
  final linkToSignUP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
         {
          selectedDate = picked;
        }
    }

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
                  controller: eventName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Event Name',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: imageURL,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'URL of the display image',
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                child: OutlinedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Start Date'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )
                      )
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
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: linkToSignUP,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'URL of link to sign up',
                  ),
                ),
              ),
              SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: 365,
                  child: ElevatedButton(onPressed: () {
                    final post = Post(
                        eventName: eventName.text,
                        imageURL: imageURL.text,
                        orgName: orgName.text,
                        volunteerRequirements: volunteerRequirements.text,
                        startDate: selectedDate,
                        commitment: commitmentPeriod.text,
                        description: description.text,
                        volunteerRewards: volunteerRewards.text,
                        linkToSignUp : linkToSignUP.text
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




