import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:pint_size/utilities/MyBottomNavBar.dart';
import 'package:pint_size/utilities/nav_drawer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarScreen extends StatefulWidget {
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController;
  //CupertinoTextField _eventController;
  List<dynamic> _selectedEvents;
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? '{}')));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Colors.grey,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (day, events) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => ListTile(
                  title: Text(event),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: new Icon(Icons.invert_colors, color: Colors.red),
        onPressed: () => alertDialog(context),
      ),
      bottomNavigationBar: MyBottomNaBar(),
    );
  }

  bool alertDialog(BuildContext context) {
    var logOff;
    _showDialog();
  }

  _showDialog() {
    showCupertinoDialog(
      context: context,

      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.light(),
          child: new CupertinoAlertDialog(
            title: new Text("Name of your Event?"),
            content: CupertinoTextField(
              controller: _eventController,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Save",
                style: TextStyle(
                  color: Color(0xffddac00),
                  fontWeight: FontWeight.bold,
                ),),
                onPressed: () {
                  if (_eventController.text.isEmpty) return;
                  setState(() {
                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]
                          .add(_eventController.text);
                    } else {
                      _events[_controller.selectedDay] = [
                        _eventController.text
                      ];
                    }
                    prefs.setString("events", json.encode(encodeMap(_events)));
                    _eventController.clear();
                    Navigator.pop(context);
                  });
                },
              ),
          
            ],
          ),
        );
      }, //builder
    );
  } // _showDialog
}
