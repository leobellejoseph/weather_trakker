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
  'Moderate Rain':
      LottieWidget(asset: 'assets/moderaterain.json', size: kLottieSmallSize),
  'Light Rain':
      LottieWidget(asset: 'assets/lightrain.json', size: kLottieSmallSize),
  'Heavy Thundery Showers with Gusty Winds':
      LottieWidget(asset: 'assets/thunderstorm.json', size: kLottieSmallSize),
  'Thundery Showers':
      LottieWidget(asset: 'assets/thunderstorm.json', size: kLottieSmallSize),
  'Partly Cloudy (Day)': LottieWidget(
      asset: 'assets/partlycloudyday.json', size: kLottieSmallSize),
  'Partly Cloudy (Night)': LottieWidget(
      asset: 'assets/partlycloudynight.json', size: kLottieSmallSize),
  'Showers':
      LottieWidget(asset: 'assets/rainshower.json', size: kLottieSmallSize),
  'Cloudy': LottieWidget(asset: 'assets/cloudy.json', size: kLottieSmallSize),
  'Heavy Rain':
      LottieWidget(asset: 'assets/heavyrain.json', size: kLottieSmallSize),
  'Sunny': LottieWidget(asset: 'assets/sunny.json', size: kLottieSmallSize),
  'Windy': LottieWidget(asset: 'assets/windy.json', size: kLottieSmallSize),
};
const kWeatherStatusLarge = {
  'Moderate Rain': LottieWidget(asset: 'assets/moderaterain.json'),
  'Heavy Rain': LottieWidget(asset: 'assets/heavyrain.json'),
  'Light Rain': LottieWidget(asset: 'assets/lightrain.json'),
  'Thundery Showers': LottieWidget(asset: 'assets/thunderstorm.json'),
  'Partly Cloudy (Day)': LottieWidget(asset: 'assets/partlycloudyday.json'),
  'Partly Cloudy (Night)': LottieWidget(asset: 'assets/partlycloudynight.json'),
  'Showers': LottieWidget(asset: 'assets/rainshower.json'),
  'Cloudy': LottieWidget(asset: 'assets/cloudy.json'),
  'Heavy Thundery Showers with Gusty Winds':
      LottieWidget(asset: 'assets/thunderstorm.json'),
  'Sunny': LottieWidget(asset: 'assets/sunny.json'),
  'Windy': LottieWidget(asset: 'assets/windy.json'),
};
const k24HourWeatherLabel = {
  '6PM12AM': 'Evening to midnight',
  '12AM6AM': 'Midnight to early morning',
  '12PM6AM': 'Noon to next day early morning',
  '6PM6AM': 'Evening to next day early morning',
  '6AM12PM': 'Morning until noon',
  '12PM6PM': 'Noon until evening',
};
