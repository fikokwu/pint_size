import "package:flutter/material.dart";
import 'package:pint_size/utilities/MyBottomNavBar.dart';
import 'package:pint_size/utilities/nav_drawer.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Center( 
        child: Text('This is your reg page'),
      ),
      bottomNavigationBar: MyBottomNaBar(),
    );
  }
}