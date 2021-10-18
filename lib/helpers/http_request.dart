import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_retry/http_retry.dart';

class HTTPRequest {
  static const baseUrl = 'https://api.data.gov.sg/v1/environment/';
  static Future<Map<String, dynamic>> get2HourNowcast() async {
    final client = RetryClient(http.Client());
    var date = DateTime.now().toIso8601String();
    if (date.contains('.')) {
      date = DateTime.now().toIso8601String().split('.')[0];
    }
    final url = Uri.parse('${baseUrl}2-hour-weather-forecast?date_time=$date');
    final response = await client.get(url);
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
