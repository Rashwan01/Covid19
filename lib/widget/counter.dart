import 'package:flutter/material.dart';

import '../constant.dart';

class Counter extends StatelessWidget {
  final Color color;
  final int number;
  final String text;
  const Counter({this.color, this.number, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: color, width: 2),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          number.toString(),
          style: TextStyle(fontSize: 30, color: color),
        ),
        Text(text, style: kSubTextStyle)
      ],
    );
  }
}
