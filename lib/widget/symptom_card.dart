import 'package:flutter/material.dart';

import '../constant.dart';

class SymptomCard extends StatelessWidget {
  final String image, subTitle;
  final bool isActive;

  const SymptomCard({this.image, this.subTitle, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor)
              : BoxShadow(
                  offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/$image"),
          Text(
            "$subTitle",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
