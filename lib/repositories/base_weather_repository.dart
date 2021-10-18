import 'package:weather_trakker/models/models.dart';

abstract class BaseWeatherRepository {
  Future<NowcastModel> fetchNowcast();
  Future<ForecastItem> fetch24HourForecast();
  Future<FourDayForecast> fetchFourDaysForecast();
}
