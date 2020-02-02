import 'package:flutter/material.dart';
import '../helper.dart';

class Minutes extends StatefulWidget {
  final Function getValue;

  Minutes({
    this.getValue,
  });

  @override
  _MinutesState createState() => _MinutesState();
}

class _MinutesState extends State<Minutes> {
  int value = 0;

  String getString(String x) {
    if (x.length == 1)
      return "0" + x;
    else
      return x;
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      height: data.size.width * 0.5,
      width: data.size.width * 0.2,
      child: Center(
        child: ListWheelScrollView.useDelegate(
          itemExtent: data.size.width * 0.175,
          diameterRatio: 100.0,
          onSelectedItemChanged: (value) {
            widget.getValue(value);
            setState(() {
              this.value = value;
            });
          },
          childDelegate: ListWheelChildLoopingListDelegate(
            children: List.generate(60, (number) {
              return Container(
                color: black,
                child: Center(
                  child: Text(
                    getString(number.toString()),
                    style: TextStyle(
                      color: (number == value ? gray : lightGray),
                      fontSize: data.size.width * 0.15,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
