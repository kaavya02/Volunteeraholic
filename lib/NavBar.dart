import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:volunteeraholic/AppThemes.dart';
import 'package:volunteeraholic/StudentLogin.dart';

const accountName = Text('Username');
const accountEmail = Text('nusemail@u.nus.edu');
const avatar = Text('none');

//change false to true when u need to check other format
const loggedIn = false;


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
    ),
    ListTile(
      leading: Icon(Icons.assignment),
      title: Text('View Appplications'),
    ),
    ListTile(
      leading: Icon(Icons.calendar_month_outlined),
      title: Text('Calendar'),
    ),
    Divider(),
    ListTile(
      leading: Icon(Icons.post_add),
      title: Text('Post'),
    ),
    ListTile(
      leading: Icon(Icons.group_add_rounded),
      title: Text('Manage Organisations'),
    ),
    Divider(),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
    ),
    ListTile(
      leading: Icon(Icons.logout),
      title: Text('Logout'),
    ),
  ];
}

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: (loggedIn) ? (LoggedIn(context)) : (notLoggedIn(context)),
      ),
    );
  }
}

