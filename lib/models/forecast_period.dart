import 'package:weather_trakker/helpers/date_formatter.dart';

enum Regions { west, east, central, south, north }

extension RegionsExtension on Regions {
  String get name {
    switch (this) {
      case Regions.central:
        return 'central';
      case Regions.east:
        return 'east';
      case Regions.north:
        return 'north';
      case Regions.south:
        return 'south';
      case Regions.west:
        return 'west';
      default:
        return 'no data';
    }
  }
}

class ForecastPeriod {
  late final TimePeriod time;
  late final ForecastRegion region;
  ForecastPeriod({required this.time, required this.region});
  factory ForecastPeriod.noData() => ForecastPeriod(
      time: TimePeriod.noData(), region: ForecastRegion.noData());
  factory ForecastPeriod.fromJson(Map<String, dynamic> data) {
    final _time = data['time'] ?? '';
    final _region = data['period'] ?? '';
    return ForecastPeriod(time: _time, region: _region);
  }
}

class TimePeriod {
  late final String start;
  late final String end;
  TimePeriod({required this.start, required this.end});
  factory TimePeriod.noData() => TimePeriod(start: 'NA', end: 'NA');
  factory TimePeriod.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return TimePeriod.noData();
    }
    final _start = data['start'];
    final _end = data['end'];
    final _startDate = DateFormatter.formatToDateTime(_start);
    final _endDate = DateFormatter.formatToDateTime(_end);
    return TimePeriod(start: _startDate, end: _endDate);
  }
}

class ForecastRegion {
  late final String west;
  late final String east;
  late final String central;
  late final String south;
  late final String north;
  ForecastRegion(
      {required this.west,
      required this.east,
      required this.central,
      required this.south,
      required this.north});
  factory ForecastRegion.noData() => ForecastRegion(
      west: 'NA', east: 'NA', central: 'NA', south: 'NA', north: 'NA');
  factory ForecastRegion.fromJson(Map<String, dynamic> data) {
    final _west = data['west'] ?? '';
    final _east = data['east'] ?? '';
    final _central = data['central'] ?? '';
    final _south = data['south'] ?? '';
    final _north = data['north'] ?? '';

    return ForecastRegion(
        west: _west,
        east: _east,
        central: _central,
        south: _south,
        north: _north);
  }
}
