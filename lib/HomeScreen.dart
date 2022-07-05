import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/Post.dart';
import 'package:volunteeraholic/NavBar.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      drawer: NavBar(),
      body:
        StreamBuilder<List<Post>>(
            stream: readPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('No posts currently available');
              } else if (snapshot.hasData) {
                final posts = snapshot.data!;
                return ListView(
                  children: posts.map(buildPost).toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            }
            ),
      );
  }
}

Widget buildPost(Post post) => Column(
  children: [
        ListTile(
      leading: CircleAvatar(
          backgroundImage: AssetImage('assets/icons/tutorIcon.png')
      ),
      title: Text(post.orgName),
      subtitle: Text(post.description),
    ),
    SizedBox(height: 20,)
  ],
);