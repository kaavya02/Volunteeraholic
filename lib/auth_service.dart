import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:volunteeraholic/HomeScreen.dart';
import 'package:volunteeraholic/OrgLogin.dart';

import 'StudentLogin.dart';

class AuthService {
// 1. handle AuthState ( )
// 2. signInWithGoogle ( )
// 3. signOut ( )
// Determine if the user is authenticated .
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return const OrgLogin();
          }
        }
    );
  }

  signInWithGoogle() async {
// Trigger the authentication flow
    final GoogleSignInAccount ? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser !
        .authentication;
// Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,

    );
// Once signed in , return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
