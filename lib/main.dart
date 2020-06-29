  
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pint_size/screens/calendar_screen.dart';
import 'package:pint_size/screens/campaign_screen.dart';
import 'package:pint_size/screens/dashboard_screen.dart';
import 'package:pint_size/screens/login_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.8=52
  @override
  Widget build(BuildContext context) {
      
      debugShowCheckedModeBanner: false;
    return MaterialApp(
      title: ('Pint Size'),
      theme: ThemeData(
        primaryColor: Colors.black,
        //cardTheme: CardTheme(color:Colors.black),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      //home: LoginScreen(),
      initialRoute: '/',
      routes: {
        //'/': (context) => SplashScreen(),
        '/': (context) => LoginScreen(),
        '/home': (context) => DashboardScreen(),
        '/campaign': (context) => CampaignScreen(),
        '/calendar': (context) => CalendarScreen(),
      }, 
      
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () => print("hello"),);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color:Color(0xffddac00), ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        _showLogo(),
                        
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(backgroundColor: Colors.black, valueColor: new AlwaysStoppedAnimation(Colors.white),),
                    Padding(padding: EdgeInsets.only(top:20.0),
                    ),
                    Text(
                      "Pint Size App",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,

                    ), 
                    ),
                  ],

                ),
              ),

          ],)
        ],
      ),
    );
  }
  Widget _buildLogo(Function onTap, AssetImage logo){

    return GestureDetector(
      //onTap: onTap,
      child: Container(
        height: 60.0,
        width: 180.0,
        decoration: BoxDecoration( 
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,2),
              blurRadius: 6.0,
            ),
          ], //boxshadow
          image: DecorationImage(
            image: logo,
          ),

        ),

      ),

    );


  }// buildlogo


Widget _showLogo(){
     return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 00.0, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildLogo(
            () => print('Logo'),
            AssetImage(
              'assets/logos/logo.jpeg',
              
            ),
          ),
        ],
      ),
    );
  } // showlogo
}

