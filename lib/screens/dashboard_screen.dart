import "package:flutter/material.dart";
import 'package:pint_size/utilities/MyBottomNavBar.dart';
import 'package:pint_size/utilities/dashboard_bloc.dart';
import 'package:pint_size/utilities/date_util.dart';

import 'package:pint_size/utilities/nav_drawer.dart';
import 'package:pint_size/utilities/radial_progress.dart';
import 'package:pint_size/utilities/top_bar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  DashboardBlock _dashboardBlock;

  @override
  void initState() {
    _dashboardBlock = DashboardBlock();
    super.initState();
  }
  

  @override
  void dispose() {
    _dashboardBlock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),

      body: Column(
       
        children: <Widget>[
          Stack(
            children: <Widget>[
              TopBar(),
              Positioned(
                top: 49,
                left: 90,
                right: 90,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        _dashboardBlock.previousMonth();

                        print('last month');
                      },
                    ),
                    StreamBuilder(
                        stream: _dashboardBlock.dataStream,
                        initialData: _dashboardBlock.selectedDate,
                        builder: (context, snapshot) {
                          return Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  formatterMonthYear.format(snapshot.data),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 1.2,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Year',
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 1.3,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    Transform.rotate(
                      angle: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {

                          _dashboardBlock.nextMonth();

                          setState(() {
                             
                             Navigator.pushReplacementNamed(context, '/July');
                         
                         
                          print('next month');
                          });
                          
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
       
          RadialProgress(),
          MonthlyStatusListing(),
        ],
      ),
      bottomNavigationBar: MyBottomNaBar(),
    );
  }
}

class MonthlyStatusListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(

      child: SingleChildScrollView(
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
       
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 170, 0),
                height: 0,
              ),
              MonthlyStatusRow('July 2020', 'On going'),
              MonthlyStatusRow('June 2020', 'Failed'),
              MonthlyStatusRow('April 2020', 'Completed'),
              MonthlyStatusRow('March 2020', 'Completed'),
              MonthlyStatusRow('May 2020', 'Completed'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 0 ,
                padding: EdgeInsets.fromLTRB(0, 50, 50, 0),
                //alignment: Alignment.centerLeft,
              ),
              MonthlyTargetRow('Campaign', '20/30'),
              MonthlyTargetRow('Donate', '15/20'),
              MonthlyTargetRow('Blood Drives', '10/10'),
              MonthlyTargetRow('Blood Drives', '20/20'),
              MonthlyTargetRow('Blood Drives', '0/0'),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

class MonthlyStatusRow extends StatelessWidget {
  final String monthYear, status;

  MonthlyStatusRow(this.monthYear, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            monthYear,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          Text(
            status,
            style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class MonthlyTargetRow extends StatelessWidget {
  final String target, targetAchieved;

  MonthlyTargetRow(this.target, this.targetAchieved);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            target,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          Text(
            targetAchieved,
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
