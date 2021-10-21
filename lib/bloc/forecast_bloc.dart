import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_trakker/models/models.dart';
import 'package:weather_trakker/repositories/repositories.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final WeatherRepository repo;
  ForecastBloc({required this.repo}) : super(ForecastState.initial()) {
    on<ForecastGeneralEvent>(_onForecastGeneralEvent);
    on<ForecastPeriodEvent>(_onForecastPeriodEvent);
  }

  FutureOr<void> _onForecastGeneralEvent(
      ForecastGeneralEvent event, Emitter<ForecastState> emit) async {
    try {
      emit(state.copyWith(newStatus: ForecastStateStatus.loading));
      final _hasConnection = await InternetConnectionChecker().hasConnection;
      if (_hasConnection == false) {
        emit(state.copyWith(newStatus: ForecastStateStatus.noInternet));
      } else {
        await Future.delayed(const Duration(seconds: 1), () async {
          final forecast = await repo.fetch24HourForecast(true);
          final fourcast = await repo.fetch4DaysForecast();
          if (forecast.isEmpty) {
            emit(state.copyWith(
                newData: [],
                newFourcast: [],
                newStatus: ForecastStateStatus.noData));
          }
          emit(state.copyWith(
              newData: forecast,
              newFourcast: fourcast,
              newStatus: ForecastStateStatus.loaded));
        });
      }
    } on Failure catch (_) {
      emit(state.copyWith(
          newStatus: ForecastStateStatus.error,
          newFailure: const Failure(
              code: '24 Hour General Forecast',
              message: 'Fetching 24 Forecast Failed.')));
    }
  }

  FutureOr<void> _onForecastPeriodEvent(
      ForecastPeriodEvent event, Emitter<ForecastState> emit) async {
    try {
      emit(state.copyWith(newStatus: ForecastStateStatus.loading));
      final forecast = await repo.fetch24HourForecast(false);
      await Future.delayed(const Duration(seconds: 1), () async {
        if (forecast.isEmpty) {
          emit(state
              .copyWith(newData: [], newStatus: ForecastStateStatus.noData));
        }
        emit(state.copyWith(
            newData: forecast, newStatus: ForecastStateStatus.loaded));
      });
    } on Failure catch (_) {
      emit(state.copyWith(
          newStatus: ForecastStateStatus.error,
          newFailure: const Failure(
              code: '24 Hour Period Forecast',
              message: 'Fetching 24 Forecast Failed.')));
    }
  }
}
