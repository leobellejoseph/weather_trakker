import 'package:equatable/equatable.dart';

class AreaModel extends Equatable {
  late final String name;
  late final LocationModel labelLocation;

  factory AreaModel.fromJson(Map<String, dynamic> data) {
    final _name = data['name'];
    final _labelLocation = LocationModel.fromJson(data['label_location'] ?? '');
    return AreaModel(name: _name, labelLocation: _labelLocation);
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'label_location': labelLocation};

  AreaModel({required this.name, required this.labelLocation});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

class LocationModel extends Equatable {
  late final double latitude;
  late final double longitude;

  LocationModel({required this.latitude, required this.longitude});

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
