import 'package:flutter/material.dart';

class TopBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return new Container(
    height: 100,
   child: new AppBar(
     //automaticallyImplyLeading: false,
     
     
   
     

     
    //  title: Text(
    //       'Dashboard',
    //       textAlign: TextAlign.center,
    //     ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      
   ),
   );
    
  }
  
}