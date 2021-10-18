import 'package:equatable/equatable.dart';

import 'location_model.dart';

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
