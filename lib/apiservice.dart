import 'dart:convert';

import 'package:http/http.dart' as http;

class APICalling {
  static const String _BASE_URL = "https://api.covid19api.com";

  Future<dynamic> getCountries() async {
    var url = _BASE_URL + "/countries";
    print("API calling: $url");
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  Future<dynamic> getCountryStatusData(String country, status) async {
    var url = _BASE_URL + "/country/$country/status/$status";
    print("API calling: $url");
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  Future<dynamic> getOneDayData() async{
    var url = _BASE_URL + "/country/Suriname/status/confirmed";
    print("API calling: $url");
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  Future<dynamic> getStatsData()async{
    var url = _BASE_URL + "/stats";
    print("Api calling: $url");
    var response = await http.get(Uri.parse(url));
    var res  = jsonDecode(response.body);
    return res;
  }

}
