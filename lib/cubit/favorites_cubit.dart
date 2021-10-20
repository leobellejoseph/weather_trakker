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
      final filtered = await _fetchFilteredNowcast(_list);
      if (filtered.list.isEmpty) {
        emit(state.copyWith(
            newData: [], newPeriod: '', newStatus: FavoriteStatus.no_data));
      } else {
        emit(state.copyWith(
            newData: filtered.list,
            newPeriod: filtered.period,
            newStatus: FavoriteStatus.loaded));
      }
    } on Failure catch (_) {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.error));
    }
  }

  void remove(ForecastModel item) async {
    try {
      emit(state.copyWith(newStatus: FavoriteStatus.loading));
      final _list = await repo.fetchFavorite(key);
      final _filteredList =
          _list.where((element) => element.area != item.area).toList();
      await repo.deleteFavorites(key);
      await repo.addFavorites(key, _filteredList);
      if (_list.isEmpty) {
        emit(state.copyWith(newData: [], newStatus: FavoriteStatus.no_data));
      }
      final filtered = await _fetchFilteredNowcast(_filteredList);

      if (filtered.list.isEmpty) {
        emit(state.copyWith(
            newData: [], newPeriod: '', newStatus: FavoriteStatus.no_data));
      } else {
        emit(state.copyWith(
            newData: filtered.list,
            newPeriod: filtered.period,
            newStatus: FavoriteStatus.loaded));
      }
    } on Failure catch (_) {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.error));
    }
  }

  void fetch() async {
    try {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.loading));

      final _data = await repo.fetchFavorite(key);
      final filtered = await _fetchFilteredNowcast(_data);
      if (filtered.list.isEmpty) {
        emit(state.copyWith(
            newData: [], newPeriod: '', newStatus: FavoriteStatus.no_data));
      } else {
        emit(state.copyWith(
            newData: filtered.list,
            newPeriod: filtered.period,
            newStatus: FavoriteStatus.loaded));
      }
    } on Failure catch (_) {
      emit(state.copyWith(newStatus: FavoriteStatus.error));
    }
  }

  void reset() async {
    try {
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.loading));
      await repo.deleteFavorites(key);
      emit(state.copyWith(newData: [], newStatus: FavoriteStatus.no_data));
    } on Failure catch (_) {
      emit(state.copyWith(newStatus: FavoriteStatus.error));
    }
  }

  Future<FilteredNowcast> _fetchFilteredNowcast(
      List<FavoritesModel> data) async {
    final List<FavoritesModel> _list = [];
    final _nowcast = await repo.fetch2HourForecast();
    String _period = '';
    for (var item in data) {
      final _items = _nowcast.items[0];
      final _forecast =
          _items.forecasts.firstWhere((e) => e.area == item.area).forecast;
      final _model = FavoritesModel(area: item.area, forecast: _forecast);
      final _start = _items.validPeriod.startTime;
      final _end = _items.validPeriod.endTime;
      _period = '$_start to $_end';
      _list.add(_model);
    }
    return FilteredNowcast(list: _list, period: _period);
  }
}
