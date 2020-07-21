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

  //Text Fields State
  String email = "";
  String password= "";
  String userName = "";
  String fullName = "";


  @override
  Widget _buildUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        //SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
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
                Icons.person_outline,
                size: 25,
                color: Colors.red,
              ),
              hintText: 'Enter your username',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value){
              setState(() => userName = value);

            },
          ),
        ),

        
        // SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
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
            onChanged: (value){
              setState(() => fullName = value);

            },
          ),
        ),

      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5.0),
              prefixIcon: Icon(
                Icons.email,
                size: 25,
                color: Colors.red,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value){
              setState(() => email = value);

            },
          ),
        ),
        //SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
  
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 40.0,
          
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5.0),
              prefixIcon: Icon(
                Icons.lock,
                size: 25,
                color: Colors.red,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value){
              setState(() => password = value);

            },
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 250,
      child: RaisedButton(
          elevation: 4.0,
          //onPressed: () => HomeScreen,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
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
          onPressed: () async{
            print(email);
            print(password);
            print(fullName);
            print(userName);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DashboardScreen(),
            //   ),
            // ); // push
          } // OnPressed
          ),
    );
    //HomeScreen();
  }

  Widget _builGoogleSignUpBtn() {
    return Container(
      width: 250,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: SignInButton(
          Buttons.Google,
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          text: 'Sign up in with Google',
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          onPressed: () => print('pressed'),
        ),
      ),
    );
  }

  Widget _buildFacebookSignUpBtn() {
    return Container(
      width: 250,
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: SignInButton(
          Buttons.Facebook,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          text: 'Sign up in with Facebook',
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          onPressed: () => print('pressed'),
        ),
      ),
    );
  }

  Widget _buildSignUpWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      
      body: Stack(
        fit: StackFit.expand,
        
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.only(top: 70),
                
                child: Image.asset(
                  'asset/logos/icon.png',
                  scale: 6.0,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  //alignment: Alignment.center,
                  child: Text(
                    'CREATE YOUR ACCOUNT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28, right: 28.0, top: 180.0),
              
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(130),
                  ),
             
                 Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(455),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 15.0,
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                  
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0 ),
                     
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildUserName(),
                          _buildName(),
                          _buildEmailTF(),
                          _buildPasswordTF(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 110),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        _buildSignUpBtn(),
                       // _buildSignUpWithText(),
                        // _builGoogleSignUpBtn(),
                        // _buildFacebookSignUpBtn(),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
