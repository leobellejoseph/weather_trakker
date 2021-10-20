import 'package:equatable/equatable.dart';

import 'location_model.dart';

class AreaModel extends Equatable {
  final String name;
  final LocationModel location;

  factory AreaModel.fromJson(Map<String, dynamic> data) {
    final _name = data['name'];
    final _location = LocationModel.fromJson(data['label_location'] ?? '');
    return AreaModel(name: _name, location: _location);
  }

  Map<String, dynamic> toJson() => {'name': name, 'label_location': location};

  const AreaModel({required this.name, required this.location});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
