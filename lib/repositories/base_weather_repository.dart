import 'package:weather_trakker/models/models.dart';

abstract class BaseWeatherRepository {
  Future<NowcastModel> fetch2HourForecast();
  Future<ForecastItem> fetch24HourForecast();
  Future<FourDayForecast> fetchFourDaysForecast();
}
