import 'package:flutter/material.dart';
import 'package:weather_trakker/widgets/widgets.dart';

const kForecastItemLabel =
    TextStyle(fontWeight: FontWeight.w700, color: Colors.white);
const kForecastPeriodWest = Text('West', style: kForecastPeriodLabel);
const kForecastPeriodEast = Text('East', style: kForecastPeriodLabel);
const kForecastPeriodCentral = Text('Central', style: kForecastPeriodLabel);
const kForecastPeriodNorth = Text('North', style: kForecastPeriodLabel);
const kForecastPeriodSouth = Text('South', style: kForecastPeriodLabel);
const kForecastPeriodLabel =
    TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold);
const kForecastPeriodStyle = TextStyle(fontSize: 10, color: Colors.white);
const kLottieLargeSize = Size(120, 120);
const kLottieSmallSize = Size(50, 50);
const kWeatherStatus = {
  'Light Rain':
      LottieWidget(asset: 'assets/lightrain.json', size: kLottieSmallSize),
  'Thundery Showers':
      LottieWidget(asset: 'assets/thunderstorm.json', size: kLottieSmallSize),
  'Partly Cloudy (Day)': LottieWidget(
      asset: 'assets/partlycloudyday.json', size: kLottieSmallSize),
  'Partly Cloudy (Night)': LottieWidget(
      asset: 'assets/partlycloudynight.json', size: kLottieSmallSize),
  'Showers':
      LottieWidget(asset: 'assets/rainshower.json', size: kLottieSmallSize),
  'Cloudy': LottieWidget(asset: 'assets/cloudy.json', size: kLottieSmallSize),
};
const kWeatherStatusLarge = {
  'Light Rain': LottieWidget(asset: 'assets/lightrain.json'),
  'Thundery Showers': LottieWidget(asset: 'assets/thunderstorm.json'),
  'Partly Cloudy (Day)': LottieWidget(asset: 'assets/partlycloudyday.json'),
  'Partly Cloudy (Night)': LottieWidget(asset: 'assets/partlycloudynight.json'),
  'Showers': LottieWidget(asset: 'assets/rainshower.json'),
  'Cloudy': LottieWidget(asset: 'assets/cloudy.json'),
};
