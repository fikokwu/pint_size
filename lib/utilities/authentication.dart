import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pint_size/screens/login_screen.dart';
import 'package:rxdart/rxdart.dart';

import 'user.dart';

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
  Future<FirebaseUser> googleSignIn() async {
    try {
      loading.add(true);
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final AuthResult authResult =
          await _authFirebase.signInWithCredential(credential);

      FirebaseUser user = authResult.user;
      updateUserData(user);

      print("user name: ${user.displayName}");
      loading.add(false);
      return user;

      //loading.add(false);
    } catch (e) {
      print("this is the error:");
      print(e.toString());
      print("error logging in");
      return e;
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
  Future<String> signOutApp() async {
    try {
      await _authFirebase.signOut();
      await _googleSignIn.signOut();
      return 'Signout';
      //Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();
      // print('$user');
      // return new LoginScreen();

      // print(_authFirebase.signOut().toString());
      // await _authFirebase.signOut();
      //await _googleSignIn.disconnect();
    } catch (e) {
      return e.toString();
      //print(e.toString());
      //print("errolor logging out");

    }
  } // end of signout

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _authFirebase.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null; 
    }
  }

  User _userFromFirebaseUser (FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }
Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _authFirebase.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
    // updateUserData(user);

    //   print("user name: ${user.displayName}");
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null; 
    }
  }

} // end of class

final AuthenticationService authService = AuthenticationService();
