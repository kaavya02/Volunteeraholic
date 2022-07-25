import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/OrgLogin.dart';
import 'package:volunteeraholic/Post.dart';
import 'package:volunteeraholic/StudentLogin.dart';
import 'package:volunteeraholic/HomeScreen.dart';
import 'package:volunteeraholic/auth_service.dart';

var accountName = Text('Username');
var accountEmail = Text((FirebaseAuth.instance.currentUser!.email! == null) ? ('nusemail@u.nus.edu') : (FirebaseAuth.instance.currentUser!.email!));

notLoggedIn(BuildContext context) {
  return [
    DrawerHeader(
      decoration: BoxDecoration(
        color: darkGreen,),
      child: Column(
        children: [
          CircleAvatar(
              child: ClipOval(
                  child: Image.asset('assets/images/logo1.png')),
              radius: 43.0),
          OutlinedButton(onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (BuildContext context) {
              return StudentLogin();
            }),);
          },
            child: Text("Login", style: TextStyle(color: light),),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                            color: Colors.blue,
                            width: 20,
                            style: BorderStyle.solid)
                    )
                )
            ),
          ),
        ],
      ),
    ),
    ListTile(
      leading: Icon(Icons.search),
      title: Text('Search'),
      onTap: () {},
    ),
    Divider(),
    ListTile(
      leading: Icon(Icons.group_add_rounded),
      title: Text('Manage Organisations'),
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) {
          return OrgLogin();
        }),);
      },
    ),
  ];
}

LoggedIn(BuildContext context) {
  return [
    UserAccountsDrawerHeader(
        accountName: accountName,
        accountEmail: accountEmail,
        currentAccountPicture: CircleAvatar(
            child: ClipOval(child:
            Image.asset('assets/images/logo1.png'))
        )
    ),
    ListTile(
      leading: Icon(Icons.search),
      title: Text('Search'),
      onTap: () {},
    ),
    ListTile(
      leading: Icon(Icons.assignment),
      title: Text('View Appplications'),
      onTap: () {},
    ),
    ListTile(
      leading: Icon(Icons.calendar_month_outlined),
      title: Text('Calendar'),
      onTap: () {},
    ),
    Divider(),
    ListTile(
      leading: Icon(Icons.group_add_rounded),
      title: Text('Post'),
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) {
          return PostScreen();
        }),);
      },
    ),

    Divider(),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
      onTap: () {},
    ),
    ListTile(
      leading: Icon(Icons.logout),
      title: Text('Logout'),
      onTap: () {
        FirebaseAuth
            .instance
            .signOut()
            .then((value) =>
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return HomeScreen();
              }
              ),
            )
        );
      },
    ),
  ];
}

class NavBar extends StatelessWidget {

  const NavBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          padding: EdgeInsets.zero,
          children: (loggedIn) ? (LoggedIn(context)) : (notLoggedIn(context)),
        ),
      ),
    );
  }
}

