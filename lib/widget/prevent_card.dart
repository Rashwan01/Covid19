import 'package:covid_19/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreventCard extends StatelessWidget {
  final String image, title, subTitle;
  const PreventCard({
    this.image,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 156,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: kShadowColor)
                  ],
                ),
              ),
              Image.asset("assets/images/$image"),
              Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 130,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: kTitleTextstyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        "$subTitle",
                        style: TextStyle(fontSize: 12),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset("assets/icons/forward.svg")),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
