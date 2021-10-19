import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_trakker/models/favorites_model.dart';
import 'package:weather_trakker/models/models.dart';
import 'package:weather_trakker/repositories/weather_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final WeatherRepository repo;
  static const key = 'favorites';
  FavoritesCubit({required this.repo}) : super(FavoritesState.initial());

  void add(ForecastModel item) async {
    try {
      emit(state.copyWith(newStatus: FavoriteStatus.loading));
      final _list = await repo.fetchFavorite(key);
      final _favorite =
          FavoritesModel(area: item.area, forecast: item.forecast);
      _list.add(_favorite);
      await repo.deleteFavorites(key);
      await repo.addFavorites(key, _list);
      if (_list.isEmpty) {
        emit(state.copyWith(newData: [], newStatus: FavoriteStatus.no_data));
      }
      emit(state.copyWith(newData: _list, newStatus: FavoriteStatus.loaded));
    } on Failure catch (_) {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.error));
    }
  }

  void remove(ForecastModel item) async {
    try {
      emit(state.copyWith(newStatus: FavoriteStatus.loading));
      final _list = await repo.fetchFavorite(key);
      final _newList =
          _list.where((element) => element.area != item.area).toList();
      await repo.deleteFavorites(key);
      await repo.addFavorites(key, _newList);
      if (_list.isEmpty) {
        emit(state.copyWith(newData: [], newStatus: FavoriteStatus.no_data));
      }
      emit(state.copyWith(newData: _list, newStatus: FavoriteStatus.loaded));
    } on Failure catch (_) {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.error));
    }
  }

  void fetch() async {
    try {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.loading));
      await Future.delayed(const Duration(milliseconds: 500), () async {
        final _data = await repo.fetchFavorite(key);
        final _nowcast = await repo.fetch2HourForecast();
        final List<FavoritesModel> _list = [];
        _data.forEach((item) {
          final _forecast = _nowcast.items[0].forecasts
              .firstWhere((element) => element.area == item.area)
              .forecast;
          final model = FavoritesModel(area: item.area, forecast: _forecast);
          _list.add(model);
        });
        if (_list.isEmpty) {
          emit(state.copyWith(newData: [], newStatus: FavoriteStatus.no_data));
        }
        emit(state.copyWith(newData: _list, newStatus: FavoriteStatus.loaded));
      });
    } on Failure catch (_) {
      emit(state.copyWith(newStatus: FavoriteStatus.error));
    }
  }

  void reset() async {
    try {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.loading));
      final _list = await repo.deleteFavorites(key);
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.no_data));
    } on Failure catch (_) {
      emit(state.copyWith(newStatus: FavoriteStatus.error));
    }
  }
}
