import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/forecast_item.dart';
import 'package:weather_trakker/models/models.dart';

import 'base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  @override
  Future<NowcastModel> fetch2HourForecast() async {
    final response = await HTTPRequest.get2HourNowcast();
    if (response.isEmpty) {
      return NowcastModel.noData();
    } else {
      return NowcastModel.fromJson(response);
    }
  }

  @override
  Future<ForecastItem> fetch24HourForecast() async {
    final response = await HTTPRequest.get24HourForecast();
    if (response.isEmpty) {
      return ForecastItem.noData();
    } else {
      return ForecastItem.fromJson(response);
    }
  }

  @override
  Future<FourDayForecast> fetchFourDaysForecast() {
    // TODO: implement fetchFourDaysForecast
    throw UnimplementedError();
  }
}
