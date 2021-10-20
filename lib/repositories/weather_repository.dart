import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/forecast_item_model.dart';
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
  Future<List<ForecastItem>> fetch24HourForecast(
      [bool isGeneral = true]) async {
    var response = {};
    if (isGeneral) {
      response = await HTTPRequest.get24HourGeneralForecast();
    } else {
      response = await HTTPRequest.get24HourPeriodForecast();
    }
    final _data = response['items'];
    final _list = (_data as List).map((e) => ForecastItem.fromJson(e)).toList();
    return _list;
  }

  @override
  Future<List<ForecastGeneral>> fetch4DaysForecast() async {
    final response = await HTTPRequest.get4DaysForecast();
    final _data = response['forecasts'];
    final _list =
        (_data as List).map((e) => ForecastGeneral.fromJson(e)).toList();
    return _list;
  }

  @override
  Future<void> addFavorites(String key, dynamic value) async {
    await _storageWrite(key, value);
  }

  @override
  Future<void> deleteFavorites(String key) async {
    await _storageRemove(key);
  }

  @override
  Future<List<FavoritesModel>> fetchFavorite(String key) async {
    final _data = await _storageRead(key);
    final _list = <FavoritesModel>[];
    if (_data.isNotEmpty) {
      _list.addAll(
          (_data as List).map((e) => FavoritesModel.fromJson(e)).toList());
    }
    return _list;
  }

  @override
  Future<void> updateFavorites(String key) {
    // TODO: implement updateFavorites
    throw UnimplementedError();
  }

  Future<dynamic> _storageRead(String key) async {
    final _data = await HydratedBloc.storage.read(key);
    if (_data == null) {
      return {};
    }
    return jsonDecode(_data);
  }

  Future<void> _storageWrite(String key, dynamic value) async {
    final data = jsonEncode(value);
    await HydratedBloc.storage.write(key, data);
  }

  Future<void> _storageRemove(String key) async {
    await HydratedBloc.storage.delete(key);
  }
}
