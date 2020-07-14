import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pint_size/screens/login_screen.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationService {
  //these are our dependecies
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _authFirebase = FirebaseAuth.instance;
  final Firestore _database = Firestore.instance;
  // these are shared state widgets
  Stream<FirebaseUser> user; // firebaseuser
  Stream<Map<String, dynamic>> profile; // custom user data in firestore
  PublishSubject loading =
      PublishSubject(); // observable that we can push new values to on

  //constructor

  AuthenticationService() {
    user = (_authFirebase.onAuthStateChanged);
    profile = user.switchMap((FirebaseUser user) {
      if (user != null) {
        return _database
            .collection('users')
            .document(user.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        // if user is not sign in
        return Stream.value({});
      }
    });
  }

// Will be used when a user taps the goolge sign in button and will take them to their
// google account so they can log in and authenticate
  Future<bool> googleSignIn() async {
    loading.add(true);
    try {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth == false) return false;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final AuthResult authResult =
          await _authFirebase.signInWithCredential(credential);
      FirebaseUser user = authResult.user;

      if (user == null) return false;
      updateUserData(user);
      loading.add(false);
      print("signed in " + user.displayName);
      return true;

      //loading.add(false);
    } catch (e) {
      print("this is the error:");
      print(e.toString());
      print("error logging in");
    }
  }

// Will update the user data inside firestore
  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _database.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

// Sign out the user from firestore
  Future <void> signOutApp() async {
    try {
      FirebaseAuth.instance.signOut();
      _googleSignIn.disconnect();
      // print(_authFirebase.signOut().toString());
      // await _authFirebase.signOut();
      //await _googleSignIn.disconnect();
    } catch (e) {
      //print(e.toString());
      //print("errolor logging out");

     
    }
    print(user.toList().toString());
  } // end of signout
} // end of class

final AuthenticationService authService = AuthenticationService();
