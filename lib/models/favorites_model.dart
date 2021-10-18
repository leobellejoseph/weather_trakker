class FavoritesModel {
  late final String area;
  late final String forecast;

  FavoritesModel({required this.area, required this.forecast});

  factory FavoritesModel.noData() => FavoritesModel(area: 'NA', forecast: 'NA');

  factory FavoritesModel.fromJson(Map<String, dynamic> data) {
    final _area = data['area'];
    final _forecast = data['forecast'] ?? '';
    return FavoritesModel(area: _area, forecast: _forecast);
  }
  Map<String, dynamic> toJson() => {
        'area': area,
        'description': forecast,
      };
  @override
  String toString() => 'area:$area,description:$forecast';
}
