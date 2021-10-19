import 'package:weather_trakker/models/favorites_model.dart';

class FilteredNowcast {
  final List<FavoritesModel> list;
  final String period;
  const FilteredNowcast({required this.list, required this.period});
}
