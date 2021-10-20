part of 'forecast_bloc.dart';

enum ForecastStateStatus { initial, loading, loaded, noData, noInternet, error }

class ForecastState extends Equatable {
  final List<ForecastItem> data;
  final List<ForecastGeneral> fourcasts;
  final ForecastStateStatus status;
  final Failure failure;
  const ForecastState(
      {required this.data,
      required this.fourcasts,
      required this.status,
      required this.failure});
  factory ForecastState.initial() => const ForecastState(
      data: [],
      fourcasts: [],
      status: ForecastStateStatus.initial,
      failure: Failure());
  ForecastState copyWith(
          {List<ForecastItem>? newData,
          List<ForecastGeneral>? newFourcast,
          ForecastStateStatus? newStatus,
          Failure? newFailure}) =>
      ForecastState(
          data: newData ?? [],
          fourcasts: newFourcast ?? [],
          status: newStatus ?? status,
          failure: newFailure ?? failure);
  @override
  List<Object> get props => [data, fourcasts, status];
}
