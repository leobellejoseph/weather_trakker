import 'package:equatable/equatable.dart';
import 'package:weather_trakker/helpers/date_formatter.dart';
import 'package:weather_trakker/models/forecast_model.dart';

class NowcastItem extends Equatable {
  late final String updateTimeStamp;
  late final String timeStamp;
  late final ValidPeriod validPeriod;
  late final List<ForecastModel> forecasts;
  NowcastItem({
    required this.updateTimeStamp,
    required this.timeStamp,
    required this.validPeriod,
    required this.forecasts,
  });

  factory NowcastItem.noData() => NowcastItem(
        updateTimeStamp: 'NA',
        timeStamp: 'NA',
        validPeriod: ValidPeriod.noData(),
        forecasts: const [],
      );

  factory NowcastItem.fromJson(Map<String, dynamic> data) {
    final _updateTimeStamp = data['update_timestamp'];
    final _timeStamp = data['timestamp'];
    final _validPeriod = ValidPeriod.fromJson(data['valid_period'] ?? '{}');
    final _forecasts = <ForecastModel>[];
    if (data['forecasts'] != null && data['forecasts'] is List) {
      final temp = (data['forecasts'] as List)
          .map((e) => ForecastModel.fromJson(e))
          .toList();
      _forecasts.addAll(temp);
    }
    return NowcastItem(
      updateTimeStamp: _updateTimeStamp,
      timeStamp: _timeStamp,
      validPeriod: _validPeriod,
      forecasts: _forecasts,
    );
  }

  @override
  List<Object?> get props =>
      [updateTimeStamp, timeStamp, validPeriod, forecasts];
}

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
      startTime: DateFormatter.formatToTime(_start),
      endTime: DateFormatter.formatToTime(_end),
    );
  }
}
