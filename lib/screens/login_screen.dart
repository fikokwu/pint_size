import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:pint_size/screens/signup_screen.dart';
import 'package:pint_size/utilities/constants.dart';
import 'package:pint_size/screens/dashboard_screen.dart';
import 'package:flutter/services.dart';
import 'package:pint_size/utilities/authentication.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationService _authenticationService = AuthenticationService();
  final _formkey = GlobalKey<FormState>();

  bool _rememberMe = false;
  String password = "";
  String email = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 95.0,
          ),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6.0,
                            color: Colors.black26,
                            offset: Offset(0, 2))
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Image.asset(
                        'asset/logos/icon.png',
                        scale: 6.0,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  height: 60.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                      hintText: 'Enter your Email',
                      hintStyle: kHintTextStyle,
                    ),
                    validator: (val) =>
                        val.isEmpty ? "Please enter your email" : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  height: 60.0,
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      hintText: 'Enter your Password',
                      hintStyle: kHintTextStyle,
                    ),
                    validator: (val) =>
                        val.isEmpty ? "Please enter your password" : null,
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Forgot Password Button Pressed'),
                    padding: EdgeInsets.only(right: 0.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  width: double.infinity,
                  child: RaisedButton(
                      elevation: 5.0,
                      //onPressed: () => HomeScreen,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.black,
                      child: Text(
                        'LOGIN',
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
                          print(email);
                          print(password);
                          print('valid');
                          dynamic result = await _authenticationService.signInWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() => error = 'Could not sign in with those credentials');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardScreen(),
                              ),
                            ); // push
                          }
                        }
                      } // OnPressed
                      ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14,),textAlign: TextAlign.center,
                ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '- OR -',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: SignInButton(
                      Buttons.Google,
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      text: 'Sign in with Google',
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0)),
                      onPressed: () async {
                        await authService.googleSignIn();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      ); // Navigation
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an Account? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
