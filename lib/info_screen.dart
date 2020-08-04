import 'package:covid_19/home.dart';
import 'package:covid_19/widget/Header.dart';
import 'package:covid_19/widget/prevent_card.dart';
import 'package:covid_19/widget/symptom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "coronadr.svg",
              topText: "Get To Know",
              bottomText: "About Covid-19",
              navBtn: "turn.svg",
              navPosition: Alignment.topLeft,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("symptoms", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SymptomCard(
                        image: "headache.png",
                        subTitle: "headache",
                      ),
                      SymptomCard(
                        isActive: true,
                        image: "caugh.png",
                        subTitle: "Caugh",
                      ),
                      SymptomCard(
                        image: "fever.png",
                        subTitle: "Fever",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Prevention", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    image: "wear_mask.png",
                    title: "Wear face mask",
                    subTitle:
                        "Since the start of the coronavirus outbreak some places have  embraced wearing facemasks",
                  ),
                  PreventCard(
                    image: "wash_hands.png",
                    title: "Wash your hands",
                    subTitle:
                        "Since the start of the coronavirus outbreak some places have embraced wearing facemasks",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
