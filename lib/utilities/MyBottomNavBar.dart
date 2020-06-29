import 'package:flutter/material.dart';

class MyBottomNaBar extends StatefulWidget {
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNaBar> {
  Color _originalColor = Colors.black;
  AnimationController _iconAnimationController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 2, bottom: 30),
      color: Color(0xffddac00),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              size: 38.0,
            ),
            onPressed: () {
              Icon(Icons.home, size: 38.0, color: Colors.grey);

              Navigator.pushReplacementNamed(context, '/home');
            },
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(
              Icons.invert_colors,
              size: 38.0,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/campaign');
            },
            color: Colors.red,
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, size: 38.0),
            onPressed: () {
              setState:
              () {
                if (_originalColor == Colors.black) {
                  _originalColor = Colors.green;
                  icon:
                  Icon(Icons.calendar_today, color: Colors.green, size: 38.0);
                } else {
                  _originalColor = Colors.pink;
                }
                ;
              };

              Navigator.pushReplacementNamed(context, '/calendar');
            },
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  bool get animationStatus {
    final AnimationStatus status = _iconAnimationController.status;
    return status == AnimationStatus.completed;
  }
}
