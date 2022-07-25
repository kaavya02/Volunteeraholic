import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/PostPage.dart';

import 'AppThemes.dart';

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}
class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {

    String orgName = "";

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Card(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search...'),
              // Input Decoration
              onChanged: (val) {
                setState(() {
                  orgName = val;
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: (orgName != "" && orgName != null)
              ? FirebaseFirestore.instance
              .collection('posts')
              .where('SearchKeyword', arrayContains: orgName)
              .snapshots()
              : FirebaseFirestore.instance.collection("posts").snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                    Card(
                    elevation: 10,
                    shadowColor: light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 20,),
                        ListTile(
                          title: Text(data['orgName']),
                          subtitle: Text(data['orgName'] +
                              '\nStart Date :' + data['orgName'] +
                              '\nDuration' + data['orgName']),
                        ),
                        TextButton(onPressed: () {
                        }, child: Text('View More ->'))
                      ],
                    ),
                  ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );

    }
  }