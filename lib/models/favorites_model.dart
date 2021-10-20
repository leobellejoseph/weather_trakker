class FavoritesModel {
  final String label;
  final String area;
  final String forecast;

  FavoritesModel(
      {required this.label, required this.area, required this.forecast});

  factory FavoritesModel.noData() =>
      FavoritesModel(label: 'NA', area: 'NA', forecast: 'NA');

  factory FavoritesModel.fromJson(Map<String, dynamic> data) {
    final _area = data['area'];
    final _forecast = data['forecast'] ?? '';
    final _label = data['label'] ?? _area;
    return FavoritesModel(label: _label, area: _area, forecast: _forecast);
  }
  Map<String, dynamic> toJson() => {
        'label': label,
        'area': area,
        'description': forecast,
      };
  @override
  String toString() => 'label:$label,area:$area,description:$forecast';
}
