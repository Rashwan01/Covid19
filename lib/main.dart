import 'package:covid_19/Model/corona.dart';
import 'package:covid_19/home.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constant.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Corona("EG"),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19',
        theme: ThemeData(
            fontFamily: "Poppins",
            scaffoldBackgroundColor: kBackgroundColor,
            // ignore: deprecated_member_use
            textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor))),
        home: HomeScreen(),
      ),
    );
  }
}
