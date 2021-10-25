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
    emit(state.copyWith(
        newForecasts: [],
        newPeriod: '',
        newStatus: NowcastStateStatus.loading));
    final _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection == false) {
      emit(state.copyWith(
          newForecasts: [], newStatus: NowcastStateStatus.noInternet));
    } else {
      final data = await repo.fetch2HourForecast();
      final items = data.items[0];
      if (items.forecasts.isEmpty) {
        emit(state.copyWith(
            newForecasts: [], newStatus: NowcastStateStatus.noForecast));
      } else {
        final validPeriod = items.validPeriod;
        final start = validPeriod.startTime;
        final end = validPeriod.endTime;
        final period = '$start to $end';
        final list = await _getList(data);
        if (list.isNotEmpty) {
          emit(state.copyWith(
              newPeriod: period,
              newForecasts: list,
              newStatus: NowcastStateStatus.loaded));
        } else {
          emit(state.copyWith(
              newPeriod: period,
              newForecasts: [],
              newStatus: NowcastStateStatus.noData));
        }
      }
    }
  }

  FutureOr<void> _onNowcastFetchAllEvent(
      NowcastFetchAllEvent event, Emitter<NowcastState> emit) async {
    emit(state
        .copyWith(newForecasts: [], newStatus: NowcastStateStatus.loading));
    final _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection == false) {
      emit(state.copyWith(newStatus: NowcastStateStatus.noInternet));
    } else {
      final data = await repo.fetch2HourForecast();
      final favorites = await repo.fetchFavorite(favoriteKey);
      final favoritesList = favorites.map((e) => e.area).toList();
      final items = data.items[0];
      if (items.forecasts.isEmpty) {
        emit(state.copyWith(
            newForecasts: [], newStatus: NowcastStateStatus.noForecast));
      }
      final start = items.validPeriod.startTime;
      final end = items.validPeriod.endTime;
      final period = '$start to $end';
      final forecasts = items.forecasts
          .map((e) => e.favorite(value: favoritesList.contains(e.area)))
          .toList();
      emit(state.copyWith(
          newPeriod: period,
          newForecasts: forecasts,
          newStatus: NowcastStateStatus.loadedAll));
    }
  }

  FutureOr<void> _onNowcastFilterEvent(
      NowcastFilterEvent event, Emitter<NowcastState> emit) async {
    emit(state
        .copyWith(newForecasts: [], newStatus: NowcastStateStatus.loading));
    final _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection == false) {
      emit(state.copyWith(newStatus: NowcastStateStatus.noInternet));
    } else {
      final query = event.query.toLowerCase();
      final data = await repo.fetch2HourForecast();
      final favorites = await repo.fetchFavorite(favoriteKey);
      final favoritesList = favorites.map((e) => e.area).toList();
      final items = data.items[0];
      if (items.forecasts.isEmpty) {
        emit(state.copyWith(
            newForecasts: [], newStatus: NowcastStateStatus.noForecast));
      }
      final validPeriod = items.validPeriod;
      final start = validPeriod.startTime;
      final end = validPeriod.endTime;
      final period = '$start to $end';
      final forecasts = items.forecasts
          .map((e) => e.favorite(value: favoritesList.contains(e.area)))
          .toList();
      final filtered =
          forecasts.where((e) => e.area.toLowerCase().contains(query)).toList();
      emit(state.copyWith(
          newPeriod: period,
          newForecasts: filtered,
          newStatus: NowcastStateStatus.loadedAll));
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
    if (locations.isNotEmpty) {
      return locations.first.area;
    } else {
      return 'Current Location';
    }
  }

  Future<List<ForecastModel>> _getList(NowcastModel data) async {
    final items = data.items[0];
    final favorites = await repo.fetchFavorite(favoriteKey);
    final favoritesList = favorites.map((e) => e.area).toList();
    final current = await _getCurrentArea(data.areas);
    final favoritesForecasts =
        items.forecasts.where((e) => favoritesList.contains(e.area)).toList();
    final currentForecasts =
        items.forecasts.where((e) => e.area == current).toList();
    final list = currentForecasts.map((e) {
      return ForecastModel(
          label: e.label == current ? 'Current Location' : e.label,
          area: e.area,
          forecast: e.forecast,
          isFavorite: false);
    }).toList();
    list.addAll(favoritesForecasts);
    return list;
  }
}
