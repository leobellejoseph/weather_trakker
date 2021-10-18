import 'package:weather_trakker/models/models.dart';

abstract class BaseWeatherRepository {
  Future<NowcastModel> fetch2HourForecast();
  Future<ForecastItem> fetch24HourForecast();
  Future<FourDayForecast> fetchFourDaysForecast();
  Future<List<FavoritesModel>> fetchFavorite(String key);
  Future<void> updateFavorites(String key);
  Future<void> deleteFavorites(String key);
  Future<void> addFavorites(String key, dynamic value);
}
