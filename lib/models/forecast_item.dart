import 'package:weather_trakker/models/forecast_general.dart';
import 'package:weather_trakker/models/forecast_period.dart';
import 'package:weather_trakker/models/models.dart';

class ForecastItem {
  late final String updateTimeStamp;
  late final String timeStamp;
  late final ValidPeriod validPeriod;
  late final ForecastGeneral general;
  late final List<ForecastPeriod> periods;
  ForecastItem(
      {required this.updateTimeStamp,
      required this.timeStamp,
      required this.validPeriod,
      required this.general,
      required this.periods});
  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    final data = json['items'];
    final _updateTimeStamp = data['update_timestamp'] ?? '';
    final _timeStamp = data['timestamp'] ?? '';
    final _validPeriod = data['valid_period'] ?? '';
    final _general = data['general'] ?? '';
    final _periods = (data['periods'] as List)
        .map((e) => ForecastPeriod.fromJson(e))
        .toList();
    return ForecastItem(
        updateTimeStamp: _updateTimeStamp,
        timeStamp: _timeStamp,
        validPeriod: ValidPeriod.fromJson(_validPeriod),
        general: ForecastGeneral.fromJson(_general),
        periods: _periods);
  }
}
