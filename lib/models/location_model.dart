import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  late final double latitude;
  late final double longitude;

  LocationModel({required this.latitude, required this.longitude});

  factory LocationModel.noData() => LocationModel(latitude: 0, longitude: 0);

  LocationModel.fromJson(Map<String, dynamic> data) {
    latitude = data['latitude'];
    longitude = data['longitude'];
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  List<Object?> get props => [latitude, longitude];
}
