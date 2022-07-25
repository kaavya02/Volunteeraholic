import 'package:flutter/material.dart';
import 'package:volunteeraholic/Post.dart';


class PostPage extends StatefulWidget {
  final Post post;
  const PostPage({Key? key, required this.post}) : super(key: key);
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.eventName),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/nus.jpg'),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text('Organisation', style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold),),
                  SizedBox(height: 8,),
                  Text(widget.post.orgName ,style: TextStyle(fontSize: 13.5,)),
                  SizedBox(height: 10,),
                  Text('Event Description', style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold),),
                  SizedBox(height: 8,),
                  Text(widget.post.description ,style: TextStyle(fontSize: 13.5,)),
                  SizedBox(height: 10,),
                  Text('Voluteer Requirements', style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold),),
                  SizedBox(height: 8,),
                  Text(widget.post.volunteerRequirements ,style: TextStyle(fontSize: 13.5,)),
                  SizedBox(height: 10,),
                  Text('Volunteer Rewards', style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold),),
                  SizedBox(height: 8,),
                  Text(widget.post.volunteerRewards ,style: TextStyle(fontSize: 13.5,)),
                  SizedBox(height: 10,),
                  Text('Start Date', style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold),),
                  SizedBox(height: 8,),
                  Text(widget.post.startDate.toString() ,style: TextStyle(fontSize: 13.5,)),
                  SizedBox(height: 10,),
                  Text('Commitment Period/ Duration', style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold),),
                  SizedBox(height: 8,),
                  Text(widget.post.commitment ,style: TextStyle(fontSize: 13.5,)),
                  SizedBox(height: 10,),
                  Text('Sign Up link', style: TextStyle(fontSize: 15, fontWeight: FontWeight. bold),),
                  SizedBox(height: 8,),
                  Text(widget.post.linkToSignUp ,style: TextStyle(fontSize: 13.5,)),

                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
