import 'package:flutter/material.dart';
import 'package:timer/helper.dart';

class Space extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: data.size.width * 0.02,
              width: data.size.width * 0.02,
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            SizedBox(
              height: data.size.width * 0.05,
            ),
            Container(
              height: data.size.width * 0.02,
              width: data.size.width * 0.02,
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
