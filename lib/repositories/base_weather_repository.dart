import 'package:weather_trakker/models/models.dart';

abstract class BaseWeatherRepository {
  Future<NowcastModel> fetchNowcast();
}
