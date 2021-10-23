import 'package:weather_trakker/models/area_model.dart';
import 'package:weather_trakker/models/nowcast_item_model.dart';

class NowcastModel {
  final List<AreaModel> areas;
  final List<NowcastItem> items;
  final String apiInfo;
  NowcastModel(
      {required this.areas, required this.items, required this.apiInfo});
  factory NowcastModel.noData() =>
      NowcastModel(areas: [], items: [], apiInfo: 'NA');
  factory NowcastModel.fromJson(Map<String, dynamic> data) {
    final _areasData = data['area_metadata'] ?? [];
    final _itemsData = data['items'] ?? [];
    final _apiInfo = data['api_info'] ?? 'NA';
    final _status = _apiInfo['status'] ?? 'NA';
    final _areas =
        (_areasData as List).map((e) => AreaModel.fromJson(e)).toList();
    final _items =
        (_itemsData as List).map((e) => NowcastItem.fromJson(e)).toList();
    return NowcastModel(areas: _areas, items: _items, apiInfo: _status);
  }
  NowcastModel filter(List<String> filters) {
    final item = items[0];
    final _forecasts =
        item.forecasts.where((e) => filters.contains(e.area)).toList();
    final newItem = NowcastItem(
        updateTimeStamp: item.updateTimeStamp,
        timeStamp: item.timeStamp,
        validPeriod: item.validPeriod,
        forecasts: _forecasts);
    return NowcastModel(areas: areas, items: [newItem], apiInfo: apiInfo);
  }
}
