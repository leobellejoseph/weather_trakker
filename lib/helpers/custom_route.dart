import 'package:flutter/material.dart';
import 'package:weather_trakker/screens/screens.dart';

class CustomRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.id:
        return SplashScreen.route();
      case HomeScreen.id:
        return HomeScreen.route();
      case FavoritesScreen.id:
        return FavoritesScreen.route();
      case LocationsScreen.id:
        return LocationsScreen.route();
      case ForecastScreen.id:
        return ForecastScreen.route();
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Unable to load screen'),
            ),
          ),
        );
    }
  }
}
