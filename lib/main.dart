import 'package:flutter/material.dart';
import 'package:weather_trakker/helpers/custom_route.dart';
import 'package:weather_trakker/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Trakker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRoute.onGenerateRoute,
      initialRoute: SplashScreen.id,
    );
  }
}
