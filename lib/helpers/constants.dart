import 'package:flutter/material.dart';
import 'package:weather_trakker/widgets/widgets.dart';

const kLottieLargeSize = Size(120, 120);
const kLottieSmallSize = Size(50, 50);
const kWeatherStatus = {
  'Light Rain':
      LottieWidget(asset: 'assets/lightrain.json', size: kLottieSmallSize),
  'Thundery Showers':
      LottieWidget(asset: 'assets/thunderstorm.json', size: kLottieSmallSize),
  'Partly Cloudy (Day)': LottieWidget(
      asset: 'assets/partlycloudyday.json', size: kLottieSmallSize),
  'Showers':
      LottieWidget(asset: 'assets/rainshower.json', size: kLottieSmallSize),
  'Cloudy': LottieWidget(asset: 'assets/cloudy.json', size: kLottieSmallSize),
};
const kWeatherStatusLarge = {
  'Light Rain': LottieWidget(asset: 'assets/lightrain.json'),
  'Thundery Showers': LottieWidget(asset: 'assets/thunderstorm.json'),
  'Partly Cloudy (Day)': LottieWidget(asset: 'assets/partlycloudyday.json'),
  'Showers': LottieWidget(asset: 'assets/rainshower.json'),
  'Cloudy': LottieWidget(asset: 'assets/cloudy.json'),
};
