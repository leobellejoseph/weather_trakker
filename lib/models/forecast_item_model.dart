import 'package:weather_trakker/models/forecast_general_model.dart';
import 'package:weather_trakker/models/forecast_period_model.dart';
import 'package:weather_trakker/models/models.dart';

class ForecastItem {
  late final String updateTimeStamp;
  late final String timeStamp;
  late final ValidPeriodForecast validPeriod;
  late final ForecastGeneral general;
  late final List<ForecastPeriod> periods;
  ForecastItem(
      {required this.updateTimeStamp,
      required this.timeStamp,
      required this.validPeriod,
      required this.general,
      required this.periods});
  factory ForecastItem.noData() => ForecastItem(
      updateTimeStamp: 'NA',
      timeStamp: 'NA',
      validPeriod: ValidPeriodForecast.noData(),
      general: ForecastGeneral.noData(),
      periods: []);
  factory ForecastItem.fromJson(Map<String, dynamic> data) {
    final _updateTimeStamp = data['update_timestamp'] ?? '';
    final _timeStamp = data['timestamp'] ?? '';
    final _validPeriod = data['valid_period'] ?? '';
    final _general = data['general'] ?? '';
    final _periodsJSON = data['periods'] ?? '';
    if (_periodsJSON == '') {
      return ForecastItem.noData();
    } else {
      final _periods = (data['periods'] as List)
          .map((e) => ForecastPeriod.fromJson(e))
          .toList();
      return ForecastItem(
          updateTimeStamp: _updateTimeStamp,
          timeStamp: _timeStamp,
          validPeriod: ValidPeriodForecast.fromJson(_validPeriod),
          general: ForecastGeneral.fromJson(_general),
          periods: _periods);
    }
  }
}
