import 'dart:convert';

import 'package:covid_19_app/src/model/all_data.dart';
import 'package:covid_19_app/src/utilities/appurl.dart';
import 'package:covid_19_app/src/widget/show_msg.dart';
import 'package:http/http.dart' as http;

class AllDataServices {
  Future<AllDataModel> fetchAllData() async {
    var data;
    try {
      http.Response response = await http.get(Uri.parse(AppUrl.allData));
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        return AllDataModel.fromJson(data);
      } else {
        showMessage("Error");
      }
    } catch (e) {
      showMessage(e.toString());
    }
    return AllDataModel.fromJson(data);
  }

  Future<List<dynamic>> countryData() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    http.Response response = await http.get(Uri.parse(AppUrl.CountriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
