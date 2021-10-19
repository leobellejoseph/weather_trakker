part of 'favorites_cubit.dart';

enum FavoriteStatus { initial, loading, loaded, no_data, no_internet, error }

class FavoritesState extends Equatable {
  final List<FavoritesModel> data;
  final String period;
  final FavoriteStatus status;
  const FavoritesState(
      {required this.data, required this.period, required this.status});

  factory FavoritesState.initial() => const FavoritesState(
      data: [], period: '', status: FavoriteStatus.initial);

  FavoritesState copyWith(
          {List<FavoritesModel>? newData,
          String? newPeriod,
          FavoriteStatus? newStatus}) =>
      FavoritesState(
          data: newData ?? data,
          period: newPeriod ?? period,
          status: newStatus ?? status);

  @override
  List<Object> get props => [data, period, status];
}
