import 'package:weather_trakker/helpers/helpers.dart';

class ValidPeriod {
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String description;
  const ValidPeriod(
      {required this.startDate,
      required this.endDate,
      required this.startTime,
      required this.endTime,
      required this.description});
  factory ValidPeriod.noData() => const ValidPeriod(
      startDate: 'NA',
      endDate: 'NA',
      startTime: 'NA',
      endTime: 'NA',
      description: 'NA');
  factory ValidPeriod.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return ValidPeriod.noData();
    }
    final _start = data['start'];
    final _end = data['end'];
    final _startHour = DateFormatter.formatToHour(_start);
    String _description = 'Morning';
    switch (_startHour) {
      case '6PM':
        _description = 'Night until Early Morning';
        break;
      case '6AM':
        _description = 'Morning until Noon';
        break;
      case '12PM':
        _description = 'Afternoon until Evening';
        break;
      default:
        _description = '';
    }
    final _startDate = DateFormatter.formatToDate(_start);
    final _endDate = DateFormatter.formatToDate(_end);
    final _startTime = DateFormatter.formatToHourMinDate(_start);
    final _endTime = DateFormatter.formatToHourMinDate(_end);
    return ValidPeriod(
      startDate: _startDate,
      endDate: _endDate,
      startTime: _startTime,
      endTime: _endTime,
      description: _description,
    );
  }
  @override
  String toString() => '$startTime,$endTime';
}

class ValidPeriodForecast {
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String description;
  const ValidPeriodForecast(
      {required this.startDate,
      required this.endDate,
      required this.startTime,
      required this.endTime,
      required this.description});
  factory ValidPeriodForecast.noData() => const ValidPeriodForecast(
      startDate: 'NA',
      endDate: 'NA',
      startTime: 'NA',
      endTime: 'NA',
      description: 'NA');
  factory ValidPeriodForecast.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return ValidPeriodForecast.noData();
    }
    final _start = data['start'];
    final _end = data['end'];
    final _startHour = DateFormatter.formatToHour(_start);
    String _description = 'Morning';
    switch (_startHour) {
      case '6PM':
        _description = 'Night until Early Morning';
        break;
      case '6AM':
        _description = 'Morning until Noon';
        break;
      case '12PM':
        _description = 'Afternoon until Evening';
        break;
      default:
        _description = '';
    }
    final _startDate = DateFormatter.formatToDate(_start);
    final _endDate = DateFormatter.formatToDate(_end);
    final _startTime = DateFormatter.formatToHourDate(_start);
    final _endTime = DateFormatter.formatToHourDate(_end);
    return ValidPeriodForecast(
      startDate: _startDate,
      endDate: _endDate,
      startTime: _startTime,
      endTime: _endTime,
      description: _description,
    );
  }
  @override
  String toString() => '$startTime,$endTime';
}
