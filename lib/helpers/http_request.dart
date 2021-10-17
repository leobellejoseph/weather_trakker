import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPRequest {
  static const baseUrl = 'https://api.data.gov.sg/v1/environment/';
  static Future<Map<String, dynamic>> get2HourNowcast() async {
    final url = Uri.parse(baseUrl + '2-hour-weather-forecast');
    final response = await http.get(url);
    if (response != null && response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }

  static Future<dynamic> get24HourForecast() async {
    final url = Uri.parse(baseUrl + '24-hour-weather-forecast');
    final response = await http.get(url);
    if (response != null && response.statusCode == 200) {
      return response.body;
    }
    return 'NA';
  }

  static Future<dynamic> get4DayForecast() async {
    final url = Uri.parse(baseUrl + '4-day-weather-forecast');
    final response = await http.get(url);
    if (response != null && response.statusCode == 200) {
      return response.body;
    }
    return 'NA';
  }
}