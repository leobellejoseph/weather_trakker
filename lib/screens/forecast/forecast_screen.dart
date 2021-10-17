import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  static const id = 'forecast';
  static Route route() => MaterialPageRoute(
        builder: (context) => const ForecastScreen(key: ValueKey(id)),
        settings: const RouteSettings(name: ForecastScreen.id),
      );
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecasts'),
      ),
      body: Container(),
    );
  }
}
