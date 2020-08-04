import 'package:covid_19/Model/corona.dart';
import 'package:covid_19/status_screen.dart';
import 'package:covid_19/widget/Header.dart';
import 'package:covid_19/widget/counter.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'info_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<Corona>(context, listen: false).getData();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyHeader(
            image: "Drcorona.svg",
            topText: "All You need",
            bottomText: "is stay at home.",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InfoScreen()));
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Consumer<Corona>(
              builder: (context, provider, _) => Row(
                children: <Widget>[
                  SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: provider.country == 'EG' ? 'EG' : provider.country,
                      items: [
                        DropdownMenuItem(
                          child: Text("Egypt"),
                          value: "EG",
                        ),
                        DropdownMenuItem(
                          child: Text("Saudi Arabia"),
                          value: "SA",
                        ),
                        DropdownMenuItem(
                          child: Text("China"),
                          value: "CN",
                        ),
                        DropdownMenuItem(
                          child: Text("USA"),
                          value: "US",
                        ),
                      ],
                      onChanged: (value) {
                        provider.changeCountry(value);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Case Updated\n", style: kTitleTextstyle),
                      TextSpan(
                          text:
                              "Newest Updated ${DateFormat('MMMd').format(DateTime.now())}",
                          style: TextStyle(color: kTitleTextColor)),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatusScreen()));
                  },
                  child: Text("see Details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2), color: kShadowColor, blurRadius: 30),
              ],
            ),
            child: Consumer<Corona>(
              builder: (context, provider, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Counter(
                      number: provider.countrydata == null
                          ? 0
                          : provider
                              .countrydata.countrydata[0].totalNewCasesToday,
                      color: kInfectedColor,
                      text: "infected"),
                  Counter(
                    number: provider.countrydata == null
                        ? 0
                        : provider.countrydata.countrydata[0].totalDeaths,
                    color: kDeathColor,
                    text: "Death",
                  ),
                  Counter(
                    number: provider.countrydata == null
                        ? 0
                        : provider.countrydata.countrydata[0].totalRecovered,
                    color: kRecovercolor,
                    text: "Recovered",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Speared Of Virus",
                  style: kTitleTextstyle,
                ),
                Text(
                  "see details",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Statistics()
        ],
      ),
    ));
  }
}

class Statistics extends StatelessWidget {
  const Statistics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(20),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 30, color: kShadowColor),
          ]),
      child: Image.asset(
        "assets/images/map.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
