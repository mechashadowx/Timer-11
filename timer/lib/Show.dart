import 'package:flutter/material.dart';
import 'helper.dart';

class Show extends StatelessWidget {
  final String show;

  Show({
    this.show,
  });

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      height: data.size.width * 0.5,
      width: data.size.width * 0.25,
      color: black,
      child: Center(
        child: Text(
          show,
          style: TextStyle(
            color: gray,
            fontSize: data.size.width * 0.15,
          ),
        ),
      ),
    );
  }
}
