import 'package:equatable/equatable.dart';

class ForecastModel extends Equatable {
  late final String area;
  late final String forecast;

  ForecastModel({required this.area, required this.forecast});
  factory ForecastModel.noData() => ForecastModel(area: 'NA', forecast: 'NA');
  ForecastModel.fromJson(Map<String, dynamic> data) {
    area = data['area'];
    forecast = data['forecast'];
  }

  Map<String, dynamic> toJson() => {'area': area, 'forecast': forecast};

  @override
  List<Object?> get props => [area, forecast];
}
