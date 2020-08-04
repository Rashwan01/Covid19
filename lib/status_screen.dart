import 'package:covid_19/home.dart';
import 'package:covid_19/widget/Header.dart';
import 'package:covid_19/widget/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/corona.dart';
import 'constant.dart';
import 'info_screen.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          MyHeader(
            image: "Drcorona.svg",
            topText: "All You need",
            bottomText: "is stay at home.",
            navBtn: "turn.svg",
            navPosition: Alignment.topLeft,
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "General",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
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
                          : provider.countrydata.countrydata[0].totalCases,
                      color: kInfectedColor,
                      text: "Total Cases"),
                  Counter(
                    number: provider.countrydata == null
                        ? 0
                        : provider.countrydata.countrydata[0].totalSeriousCases,
                    color: kDeathColor,
                    text: "Total Death",
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
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
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
                      text: " Cases"),
                  Counter(
                    number: provider.countrydata == null
                        ? 0
                        : provider
                            .countrydata.countrydata[0].totalNewDeathsToday,
                    color: kDeathColor,
                    text: "Death",
                  ),
                  Counter(
                    number: provider.countrydata == null
                        ? 0
                        : provider.countrydata.countrydata[0].totalActiveCases,
                    color: kRecovercolor,
                    text: "Active",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}
