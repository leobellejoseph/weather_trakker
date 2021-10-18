part of 'favorites_cubit.dart';

enum FavoriteStatus { initial, loading, loaded, reset, error }

class FavoritesState extends Equatable {
  final List<FavoritesModel> data;
  final FavoriteStatus status;
  const FavoritesState({required this.data, required this.status});

  factory FavoritesState.initial() =>
      const FavoritesState(data: [], status: FavoriteStatus.initial);

  FavoritesState copyWith(
          {List<FavoritesModel>? newData, FavoriteStatus? newStatus}) =>
      FavoritesState(data: newData ?? data, status: newStatus ?? status);

  @override
  List<Object> get props => [data, status];
}
