import 'package:equatable/equatable.dart';

class ForecastModel extends Equatable {
  final String area;
  final String forecast;

  const ForecastModel({required this.area, required this.forecast});
  factory ForecastModel.noData() =>
      const ForecastModel(area: 'NA', forecast: 'NA');
  factory ForecastModel.fromJson(Map<String, dynamic> data) {
    final _area = data['area'];
    final _forecast = data['forecast'];
    return ForecastModel(area: _area, forecast: _forecast);
  }

  Map<String, dynamic> toJson() => {'area': area, 'forecast': forecast};

  @override
  List<Object?> get props => [area, forecast];
}
