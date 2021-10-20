import 'package:weather_trakker/models/models.dart';

abstract class BaseWeatherRepository {
  Future<NowcastModel> fetch2HourForecast();
  Future<List<ForecastItem>> fetch24HourForecast(bool isGeneral);
  Future<List<ForecastGeneral>> fetch4DaysForecast();
  Future<List<FavoritesModel>> fetchFavorite(String key);
  Future<void> updateFavorites(String key);
  Future<void> deleteFavorites(String key);
  Future<void> addFavorites(String key, dynamic value);
}
