import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/Show.dart';
import 'package:timer/Space.dart';
import 'package:timer/helper.dart';

class Start extends StatefulWidget {
  static final String id = 'start_page';

  final int hours, minutes, seconds;

  Start({
    this.hours,
    this.minutes,
    this.seconds,
  });

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  int hours, minutes, seconds;
  bool going;

  @override
  void initState() {
    super.initState();
    hours = widget.hours;
    minutes = widget.minutes;
    seconds = widget.seconds;
    start();
  }

  start() {
    setState(() {
      going = true;
    });
    Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        setState(() {
          if (going == false) {
            t.cancel();
          }
          if (seconds == 0) {
            if (minutes == 0) {
              if (hours == 0) {
                t.cancel();
              } else {
                hours--;
                minutes = 59;
                seconds = 59;
              }
            } else {
              minutes--;
              seconds = 59;
            }
          } else {
            seconds--;
          }
        });
      },
    );
  }

  pause() {
    setState(() {
      going = !going;
    });
  }

  stop() {
    Navigator.pop(context);
  }

  String toSomething(int a) {
    String x = a.toString();
    if (x.length == 1)
      return "0" + x;
    else
      return x;
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: data.size.height * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Show(
                      show: toSomething(hours),
                    ),
                    Space(),
                    Show(
                      show: toSomething(minutes),
                    ),
                    Space(),
                    Show(
                      show: toSomething(seconds),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (going) {
                        pause();
                      } else {
                        start();
                      }
                    },
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
                          going ? 'Pause' : 'Start',
                          style: TextStyle(
                            color: black,
                            fontSize: data.size.width * 0.08,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: stop,
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
                          'Stop',
                          style: TextStyle(
                            color: black,
                            fontSize: data.size.width * 0.08,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
