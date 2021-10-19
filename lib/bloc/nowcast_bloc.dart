import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_trakker/models/models.dart';
import 'package:weather_trakker/repositories/repositories.dart';

part 'nowcast_event.dart';
part 'nowcast_state.dart';

class NowcastBloc extends Bloc<NowcastEvent, NowcastState> {
  final WeatherRepository repo;
  NowcastBloc({required this.repo}) : super(NowcastState.initial()) {
    on<NowcastFetchEvent>(_onNowcastFetchEvent);
    on<NowcastFilterEvent>(_onNowcastFilterEvent);
  }

  FutureOr<void> _onNowcastFetchEvent(
      NowcastFetchEvent event, Emitter<NowcastState> emit) async {
    emit(state.copyWith(newStatus: NowcastStateStatus.loading));
    final _hasConnection = await InternetConnectionChecker().hasConnection;
    if (_hasConnection == false) {
      emit(state.copyWith(newStatus: NowcastStateStatus.no_internet));
    } else {
      final data = await repo.fetch2HourForecast();
      emit(state.copyWith(newData: data, newStatus: NowcastStateStatus.loaded));
    }
  }

  FutureOr<void> _onNowcastFilterEvent(
      NowcastFilterEvent event, Emitter<NowcastState> emit) async {
    emit(state.copyWith(newStatus: NowcastStateStatus.loading));
    final data = await repo.fetch2HourForecast();
    emit(state.copyWith(newData: data, newStatus: NowcastStateStatus.loaded));
  }
}
