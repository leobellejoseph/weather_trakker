import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final double latitude;
  final double longitude;

  const LocationModel({required this.latitude, required this.longitude});

  factory LocationModel.noData() =>
      const LocationModel(latitude: 0, longitude: 0);

  factory LocationModel.fromJson(Map<String, dynamic> data) {
    final _lat = data['latitude'];
    final _long = data['longitude'];
    return LocationModel(latitude: _lat, longitude: _long);
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  List<Object?> get props => [latitude, longitude];
}
