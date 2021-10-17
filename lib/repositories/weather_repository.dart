import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/models.dart';

import 'base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  @override
  Future<NowcastModel> fetchNowcast() async {
    final response = await HTTPRequest.get2HourNowcast();
    if (response.isEmpty) {
      return NowcastModel.noData();
    } else {
      return NowcastModel.fromJson(response);
    }
  }
}
