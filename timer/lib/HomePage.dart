import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer/Space.dart';
import 'package:timer/Start.dart';
import 'package:timer/helper.dart';
import 'package:timer/time/Hours.dart';
import 'package:timer/time/Minutes.dart';
import 'package:timer/time/Seconds.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int hours, minutes, seconds;

  @override
  void initState() {
    super.initState();
    hours = 0;
    minutes = 0;
    seconds = 0;
  }

  getHours(int x) {
    setState(() {
      hours = x;
    });
  }

  getMinutes(int x) {
    setState(() {
      minutes = x;
    });
  }

  getSeconds(int x) {
    setState(() {
      seconds = x;
    });
  }

  start() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Start(
          hours: hours,
          minutes: minutes,
          seconds: seconds,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: data.size.height * 0.3,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hours(
                      getValue: getHours,
                    ),
                    Space(),
                    Minutes(
                      getValue: getMinutes,
                    ),
                    Space(),
                    Seconds(
                      getValue: getSeconds,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: start,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: data.size.height * 0.08,
                ),
                height: data.size.width * 0.15,
                width: data.size.width * 0.3,
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(
                    data.size.width * 0.05,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: black,
                      fontSize: data.size.width * 0.08,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
