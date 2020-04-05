import 'dart:convert';
import 'package:http/http.dart' as http;

const summaryUrl = 'https://api.covid19api.com/summary';
const getTotalData = 'https://api.thevirustracker.com/free-api?global=stats';

class CountryCodesFetch {
  Future getCountryCodesFromUrl() async {
    http.Response response = await http.get(summaryUrl);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body)['Countries'];
      return decodedData;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

  Future getAllGlobalInfo() async {
    http.Response response = await http.get(getTotalData);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body)['results'];
      return decodedData;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
