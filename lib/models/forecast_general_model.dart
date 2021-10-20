import 'package:weather_trakker/helpers/date_formatter.dart';

class ForecastGeneral {
  final String forecast;
  final RelativeHumidity humidity;
  final Temperature temperature;
  final WindSpeed windSpeed;
  final String forecastDate;
  ForecastGeneral(
      {required this.forecast,
      required this.humidity,
      required this.temperature,
      required this.windSpeed,
      String? date})
      : forecastDate = date ??
            DateFormatter.formatToDate(
              DateTime.now().toIso8601String(),
            );
  factory ForecastGeneral.noData() => ForecastGeneral(
      forecast: 'NA',
      humidity: RelativeHumidity.noData(),
      temperature: Temperature.noData(),
      windSpeed: WindSpeed.noData());
  factory ForecastGeneral.fromJson(Map<String, dynamic> data) {
    final _forecast = data['forecast'] ?? 'NA';
    final _humidity = data['relative_humidity'] ?? '';
    final _temperature = data['temperature'] ?? '';
    final _windspeed = data['wind'] ?? '';
    final _now = DateTime.now().toIso8601String();
    final _date = DateFormatter.formatToDate(data['date'] ?? _now);
    final _wind = WindSpeed.fromJson(_windspeed);
    final _temp = Temperature.fromJson(_temperature);
    final _humid = RelativeHumidity.fromJson(_humidity);
    return ForecastGeneral(
        forecast: _forecast,
        humidity: _humid,
        temperature: _temp,
        windSpeed: _wind,
        date: _date);
  }
}

class RelativeHumidity {
  late final int low;
  late final int high;
  RelativeHumidity({required this.low, required this.high});
  factory RelativeHumidity.noData() => RelativeHumidity(low: 0, high: 0);
  factory RelativeHumidity.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return RelativeHumidity(low: 0, high: 0);
    }
    final _low = data['low'] ?? 0;
    final _high = data['high'] ?? 0;
    return RelativeHumidity(low: _low, high: _high);
  }
}

class Temperature {
  late final int low;
  late final int high;
  Temperature({required this.low, required this.high});
  factory Temperature.noData() => Temperature(low: 0, high: 0);
  factory Temperature.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return Temperature(low: 0, high: 0);
    }
    final _low = data['low'] ?? 0;
    final _high = data['high'] ?? 0;
    return Temperature(low: _low, high: _high);
  }
}

class WindSpeed {
  late final int low;
  late final int high;
  late final String direction;
  WindSpeed({required this.low, required this.high, required this.direction});
  factory WindSpeed.noData() => WindSpeed(low: 0, high: 0, direction: 'NA');
  factory WindSpeed.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty || data['speed'] == null) {
      return WindSpeed.noData();
    }
    final _low = data['speed']['low'] ?? 0;
    final _high = data['speed']['high'] ?? 0;
    final _direction = data['direction'] ?? 'NA';
    return WindSpeed(low: _low, high: _high, direction: _direction);
  }
  @override
  String toString() => '$low,$high,$direction';
}
