part of 'nowcast_bloc.dart';

enum NowcastStateStatus { initial, loading, loaded, noData, noInternet, error }

class NowcastState extends Equatable {
  final NowcastModel data;
  final NowcastStateStatus status;
  const NowcastState({required this.data, required this.status});
  factory NowcastState.initial() => NowcastState(
      data: NowcastModel.noData(), status: NowcastStateStatus.initial);

  NowcastState copyWith(
          {NowcastModel? newData, NowcastStateStatus? newStatus}) =>
      NowcastState(data: newData ?? data, status: newStatus ?? status);

  @override
  List<Object> get props => [data];
}
