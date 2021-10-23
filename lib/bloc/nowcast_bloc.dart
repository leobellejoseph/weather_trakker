import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/models.dart';
import 'package:weather_trakker/repositories/repositories.dart';

part 'nowcast_event.dart';
part 'nowcast_state.dart';

class NowcastBloc extends Bloc<NowcastEvent, NowcastState> {
  final WeatherRepository repo;

  NowcastBloc({required this.repo}) : super(NowcastState.initial()) {
    on<NowcastFetchEvent>(_onNowcastFetchEvent);
    on<NowcastFilterEvent>(_onNowcastFilterEvent);
    on<NowcastFetchAllEvent>(_onNowcastFetchAllEvent);
  }

  FutureOr<void> _onNowcastFetchEvent(
      NowcastFetchEvent event, Emitter<NowcastState> emit) async {
    emit(state.copyWith(newStatus: NowcastStateStatus.loading));
    final _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection == false) {
      emit(state.copyWith(newStatus: NowcastStateStatus.noInternet));
    } else {
      final data = await repo.fetch2HourForecast();
      // final _items = data.items[0];
      final _start = data.items[0].validPeriod.startTime;
      final _end = data.items[0].validPeriod.endTime;
      final _period = '$_start to $_end';
      final favorites = await repo.fetchFavorite(favoriteKey);
      final favoritesList = favorites.map((e) => e.area).toList();
      final current = await _getCurrentArea(data.areas);
      final favoritesForecasts = data.items[0].forecasts
          .where((e) => favoritesList.contains(e.area))
          .toList();
      final currentForecasts =
          data.items[0].forecasts.where((e) => e.area == current).toList();
      final list = currentForecasts.map((e) {
        return ForecastModel(
            label: e.label == current ? 'Current Location' : e.label,
            area: e.area,
            forecast: e.forecast);
      }).toList();
      list.addAll(favoritesForecasts);
      emit(state.copyWith(
          newPeriod: _period,
          newForecasts: list,
          newStatus: NowcastStateStatus.loaded));
    }
  }

  FutureOr<void> _onNowcastFetchAllEvent(
      NowcastFetchAllEvent event, Emitter<NowcastState> emit) async {
    emit(state.copyWith(newStatus: NowcastStateStatus.loading));
    final _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection == false) {
      emit(state.copyWith(newStatus: NowcastStateStatus.noInternet));
    } else {
      final data = await repo.fetch2HourForecast();
      final _items = data.items[0];
      final _start = _items.validPeriod.startTime;
      final _end = _items.validPeriod.endTime;
      final _period = '$_start to $_end';
      emit(state.copyWith(
          newPeriod: _period,
          newForecasts: data.items[0].forecasts,
          newStatus: NowcastStateStatus.loadedAll));
    }
  }

  FutureOr<void> _onNowcastFilterEvent(
      NowcastFilterEvent event, Emitter<NowcastState> emit) async {
    emit(state.copyWith(newStatus: NowcastStateStatus.loading));
    final _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection == false) {
      emit(state.copyWith(newStatus: NowcastStateStatus.noInternet));
    } else {
      final data = await repo.fetch2HourForecast();
      final _items = data.items[0];
      final _start = _items.validPeriod.startTime;
      final _end = _items.validPeriod.endTime;
      final _period = '$_start to $_end';
      final _query = event.query.toLowerCase();
      final _forecasts = data.items[0].forecasts
          .where((e) => e.area.toLowerCase().contains(_query))
          .toList();
      emit(state.copyWith(
          newPeriod: _period,
          newForecasts: _forecasts,
          newStatus: NowcastStateStatus.loaded));
    }
  }

  Future<String> _getCurrentArea(List<AreaModel> areas) async {
    final locations = <AreaDistance>[];
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (enabled) {
      final permission = await Geolocator.checkPermission();
      final hasPermission = (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse);
      if (hasPermission) {
        final position = await Geolocator.getCurrentPosition();
        for (final area in areas) {
          final distance = Geolocator.distanceBetween(
              position.latitude,
              position.longitude,
              area.location.latitude,
              area.location.longitude);
          locations.add(AreaDistance(area: area.name, distance: distance));
        }
        locations.sort((a, b) => a.distance.compareTo(b.distance));
      }
    }
    return locations.first.area;
  }
}
