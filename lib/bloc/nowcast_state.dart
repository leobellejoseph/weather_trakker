part of 'nowcast_bloc.dart';

enum NowcastStateStatus {
  initial,
  loading,
  loaded,
  loadedAll,
  noData,
  noInternet,
  error,
  noForecast,
}

class NowcastState extends Equatable {
  final String period;
  final List<ForecastModel> forecasts;
  final NowcastStateStatus status;
  const NowcastState(
      {required this.period, required this.forecasts, required this.status});
  factory NowcastState.initial() => const NowcastState(
      period: '', forecasts: [], status: NowcastStateStatus.initial);

  NowcastState copyWith(
          {String? newPeriod,
          List<ForecastModel>? newForecasts,
          NowcastStateStatus? newStatus}) =>
      NowcastState(
          period: newPeriod ?? period,
          forecasts: newForecasts ?? forecasts,
          status: newStatus ?? status);

  @override
  List<Object> get props => [period, forecasts, status];
}
