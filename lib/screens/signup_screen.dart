import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:pint_size/utilities/authentication.dart';
import 'package:pint_size/utilities/constants.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'dashboard_screen.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthenticationService _authenticationService = AuthenticationService();
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  final _formkey4 = GlobalKey<FormState>();
  final _formkey5 = GlobalKey<FormState>();

  //Text Fields State
  String email = "";
  String password = "";
  String userName = "";
  String fullName = "";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Container(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  // container for logo
                  child: Padding(
                    padding: EdgeInsets.only(top: 110),
                    child: Image.asset(
                      'asset/logos/icon.png',
                      scale: 6.0,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'CREATE YOUR ACCOUNT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 40.0,
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 5),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      size: 25,
                      color: Colors.red,
                    ),
                    hintText: 'Enter your username',
                    hintStyle: kHintTextStyle,
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Please enter a username' : null,
                  onChanged: (value) {
                    setState(() => userName = value);
                  },
                ),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 40.0,
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 5),
                    prefixIcon: Icon(
                      Icons.assignment_ind,
                      size: 25,
                      color: Colors.red,
                    ),
                    hintText: 'Enter your Full Name',
                    hintStyle: kHintTextStyle,
                  ),
                  onChanged: (value) {
                    setState(() => fullName = value);
                  },
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 250,
                child: RaisedButton(
                    elevation: 4.0,
                    //onPressed: () => HomeScreen,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    color: Colors.black,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        // print(email);
                        // print(password);
                        print(fullName);
                        print(userName);
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DashboardScreen(),
                      //   ),
                      // ); // push
                    } // OnPressed
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
