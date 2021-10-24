import 'package:equatable/equatable.dart';

class ForecastModel extends Equatable {
  final String label;
  final String area;
  final String forecast;
  final bool isFavorite;
  const ForecastModel(
      {required this.label,
      required this.area,
      required this.forecast,
      required this.isFavorite});
  factory ForecastModel.noData() => const ForecastModel(
      label: 'NA', area: 'NA', forecast: 'NA', isFavorite: false);
  factory ForecastModel.fromJson(Map<String, dynamic> data) {
    final _area = data['area'];
    final _forecast = data['forecast'];
    return ForecastModel(
        label: _area, area: _area, forecast: _forecast, isFavorite: false);
  }
  ForecastModel favorite({bool? value}) => ForecastModel(
      label: label,
      area: area,
      forecast: forecast,
      isFavorite: value ?? isFavorite);

  Map<String, dynamic> toJson() =>
      {'label': label, 'area': area, 'forecast': forecast};

  @override
  List<Object?> get props => [label, area, forecast, isFavorite];
}
