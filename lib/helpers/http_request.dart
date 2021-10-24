import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;
import 'package:http_retry/http_retry.dart';

class HTTPRequest {
  static const baseUrl = 'https://api.data.gov.sg/v1/environment/';
  static Future<Map<String, dynamic>> get2HourNowcast() async {
    final client = RetryClient(http.Client());
    var date = formatDate(
        DateTime.now(), [yyyy, '-', mm, '-', dd, 'T', hh, ':', nn, ':', ss]);
    final url = Uri.parse('${baseUrl}2-hour-weather-forecast?date_time=$date');
    print(url);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }

  static Future<Map<String, dynamic>> get24HourGeneralForecast() async {
    final client = RetryClient(http.Client());
    var date = DateTime.now().toIso8601String();
    if (date.contains('.')) {
      date = DateTime.now().toIso8601String().split('.')[0];
    }
    final url = Uri.parse('${baseUrl}24-hour-weather-forecast?date_time=$date');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }

  static Future<Map<String, dynamic>> get24HourPeriodForecast() async {
    final client = RetryClient(http.Client());
    final date = DateTime.now().toIso8601String();
    final url = Uri.parse('${baseUrl}24-hour-weather-forecast?date_time=$date');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }

  static Future<Map<String, dynamic>> get4DaysForecast() async {
    final client = RetryClient(http.Client());
    var date = DateTime.now().toIso8601String();
    if (date.contains('.')) {
      date = DateTime.now().toIso8601String().split('.')[0];
    }
    final url = Uri.parse('${baseUrl}4-day-weather-forecast?date_time=$date');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return {};
  }
}
