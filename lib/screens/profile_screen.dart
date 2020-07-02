import 'dart:math';

import "package:flutter/material.dart";
import 'package:pint_size/utilities/MyBottomNavBar.dart';
import 'package:pint_size/utilities/nav_drawer.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Welcome to your profile'),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 60),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'asset/logos/profile.jpeg',
                ),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text(
                "Arnold Gihozo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 3),
              Text(
                "Blood Type"
              ),

              // Message Icon
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    color: Color(0xffc9470f),
                    onPressed: (){},
                  ),

                  // Add Friend Icon
                  SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    color: Color(0xffddac00),
                    onPressed: (){},
                  ),

                ],
              ),

              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildCategory("Campaigns"),

                    _buildCategory("Friends"),

                    _buildCategory("Donation"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNaBar(),
    );
  }
  Widget _buildCategory(String title){
    return Column(
      children: <Widget>[
        FlatButton(onPressed: () { print("Pressed"); },
        child: Text(      random.nextInt(10000).toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),),
        // Text(
        //   random.nextInt(10000).toString(),
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 22,
        //   ),
        // ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
          ),
        ),
      ],
    );
  }// _buildCategory
}
