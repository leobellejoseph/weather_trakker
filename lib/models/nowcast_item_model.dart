import 'package:equatable/equatable.dart';
import 'package:weather_trakker/models/models.dart';

class NowcastItem extends Equatable {
  final String updateTimeStamp;
  final String timeStamp;
  final ValidPeriod validPeriod;
  final List<ForecastModel> forecasts;
  const NowcastItem({
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
    final _updateTimeStamp = data['update_timestamp'] ?? '';
    final _timeStamp = data['timestamp'] ?? '';
    final _validPeriodJSON = data['valid_period'] ?? '';
    final _validPeriod = _validPeriodJSON == ''
        ? ValidPeriod.noData()
        : ValidPeriod.fromJson(data['valid_period'] ?? '');

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
