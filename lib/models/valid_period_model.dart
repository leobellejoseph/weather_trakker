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
    return ValidPeriod(
      startDate: DateFormatter.formatToDate(_start),
      endDate: DateFormatter.formatToDate(_end),
      startTime: DateFormatter.formatToHourDate(_start),
      endTime: DateFormatter.formatToHourDate(_end),
      description: _description,
    );
  }
  @override
  String toString() => '$startTime,$endTime';
}
