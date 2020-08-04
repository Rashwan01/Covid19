import 'package:covid_19/Model/countryDataModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Corona extends ChangeNotifier {
  String country;
  Corona(this.country);
  Country countrydata;
  Future<void> getData() async {
    var url = 'https://api.thevirustracker.com/free-api?countryTotal=$country';
    var response = await http.get(url);
    Map responseData = json.decode(response.body);
    print(responseData);
    countrydata = Country.fromJson(responseData);
    print(countrydata.countrydata[0].totalCases.toString());

    notifyListeners();
  }

  void changeCountry(c) {
    this.country = c;
    getData();
    notifyListeners();
  }
}
