import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pint_size/screens/calendar_screen.dart';
import 'package:pint_size/screens/campaign_screen.dart';
import 'package:pint_size/screens/dashboard_screen.dart';
import 'package:pint_size/screens/login_screen.dart';
import 'package:pint_size/screens/profile_screen.dart';
import 'package:pint_size/utilities/authentication.dart';

class NavDrawer extends StatefulWidget {
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final AuthenticationService _auth = AuthenticationService();
  Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffddac00),
        child: new ListView(
          padding: EdgeInsets.only(bottom: 20),
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color(0xffc9470f),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                ); // Na vigation
              },
            ),
            ListTile(
              leading: Icon(
                Icons.announcement,
                color: Colors.white,
              ),
              title: Text('News'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                ); // Navigation
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              title: Text('Calendar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalendarScreen(),
                  ),
                ); // Navigation
              },
            ),
            ListTile(
              leading: Icon(
                Icons.invert_colors,
                color: Colors.red,
              ),
              title: Text('Campaign'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CampaignScreen(),
                  ),
                ); // Navigation
              }, //onTap
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: Text('Logout'),
              onTap: () {
                _showDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  bool alertDialog(BuildContext context) {
    _showDialog();
  }

  _showDialog() {
    bool logOff = false;
    return showDialog(
      context: context,
      child: new CupertinoAlertDialog(
        title: new Text(" Loging Off"),
        content: Text("Are you sure you want to log-off?"),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => {
              logOff = false,
              Navigator.of(context).pop(),
              print(logOff),
            },
          ),
          // StreamBuilder(
          //   stream: authService.user,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return MaterialButton(
          //         onPressed: () => authService.signOutApp(),
          //         color: Colors.red,
          //         textColor: Colors.white,
          //         child: Text('Signout'),
          //       );
          //     }
          //   },
          // ),
          FlatButton(
            child: Text(
              "Yes",
              style: TextStyle(
                color: Color(0xffddac00),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
             await _auth.signOutApp();
              print(user);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
} // _showDialog
