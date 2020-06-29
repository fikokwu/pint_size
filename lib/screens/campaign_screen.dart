import "package:flutter/material.dart";
import 'package:pint_size/screens/registration.dart';

import 'package:pint_size/utilities/nav_drawer.dart';
import 'package:pint_size/utilities/MyBottomNavBar.dart';



class CampaignScreen extends StatefulWidget {
  @override
  _CampaignScreenState createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Campaign'),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: 
      Container( 
        padding: EdgeInsets.fromLTRB(105, 90, 105, 250),
        height: MediaQuery.of(context).size.height,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
           
           children: <Widget>[
             new Text(
               "Text here",
               textAlign: TextAlign.start,
               style: TextStyle(
                 fontSize: 40.0,
                 fontFamily: 'OpenSans',
                 fontWeight: FontWeight.bold,
                 fontStyle: FontStyle.normal,
               ),
             ),
             Expanded(child: Container()),
             _buildPublicBtn(),
             _buildPrivateBtn(),
           ],
           
         ),
         
   
        //_buildPublicBtn(),
        //child: Column(),
        
      ),
      bottomNavigationBar: MyBottomNaBar(),
    );
  }
  Widget _buildPrivateBtn() {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 50.0),
      width: 200,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(28.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: Color(0xffddac00),
        child: Text(
          'Private',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Registration(),

            ),
           ); // push
        }// OnPressed
      ),
       
    );
    //HomeScreen();
    
  } //_buildPrivateBtn

   Widget _buildPublicBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      width: 200,
      child: RaisedButton(
        elevation: 5.0,
        //onPressed: () => HomeScreen,
        padding: EdgeInsets.all(28.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: Color(0xffc9470f),
        child: Text(
          'Public',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Registration()

            ),
           ); // push
        }// OnPressed
      ),
       
    );
    //HomeScreen();
    
  } //_buildPrivateBtn
}