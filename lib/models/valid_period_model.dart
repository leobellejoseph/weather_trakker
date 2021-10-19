import 'package:weather_trakker/helpers/helpers.dart';

class ValidPeriod {
  late final String startDate;
  late final String endDate;
  late final String startTime;
  late final String endTime;
  ValidPeriod(
      {required this.startDate,
      required this.endDate,
      required this.startTime,
      required this.endTime});
  factory ValidPeriod.noData() => ValidPeriod(
      startDate: 'NA', endDate: 'NA', startTime: 'NA', endTime: 'NA');
  factory ValidPeriod.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return ValidPeriod.noData();
    }
    final _start = data['start'];
    final _end = data['end'];
    return ValidPeriod(
      startDate: DateFormatter.formatToDate(_start),
      endDate: DateFormatter.formatToDate(_end),
      startTime: DateFormatter.formatToDateHour(_start),
      endTime: DateFormatter.formatToDateHour(_end),
    );
  }
}
