import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/Post.dart';
import 'package:volunteeraholic/NavBar.dart';
import 'package:volunteeraholic/PostPage.dart';
import 'package:volunteeraholic/StudentOrgScreen.dart';

import 'auth_service.dart';

var loggedIn = (FirebaseAuth.instance.currentUser == null) ? (false) : (true);
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    Widget buildPost(Post post) => Card(
      elevation: 10,
      shadowColor: light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20,),
          ListTile(
            title: Text(post.eventName),
            subtitle: Text(post.orgName +
                '\nStart Date :' + post.startDate.toString() +
                '\nDuration' + post.commitment),
          ),
          TextButton(onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (BuildContext context) {
              return PostPage(post: post);
            }),);
          }, child: Text('View More ->'))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      drawer: NavBar(),
      body:
        StreamBuilder<List<Post>>(
            stream: readPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final posts = snapshot.data!;
                return ListView(
                  children: posts.map(buildPost).toList(),
                );
              } else if (snapshot.hasError) {
                return Text('An error has occurred: ${snapshot.error}');
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            }
            ),
      );
  }
}
