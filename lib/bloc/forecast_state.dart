part of 'forecast_bloc.dart';

enum ForecastStateStatus { initial, loading, loaded, noData, noInternet, error }

class ForecastState extends Equatable {
  final List<ForecastItem> data;
  final ForecastStateStatus status;
  final Failure failure;
  const ForecastState(
      {required this.data, required this.status, required this.failure});
  factory ForecastState.initial() => const ForecastState(
      data: [], status: ForecastStateStatus.initial, failure: Failure());
  ForecastState copyWith(
          {List<ForecastItem>? newData,
          ForecastStateStatus? newStatus,
          Failure? newFailure}) =>
      ForecastState(
          data: newData ?? [],
          status: newStatus ?? status,
          failure: newFailure ?? failure);
  @override
  List<Object> get props => [data, status];
}
