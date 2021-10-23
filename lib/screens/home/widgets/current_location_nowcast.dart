import 'package:flutter/material.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class CurrentLocationNowcast extends StatefulWidget {
  const CurrentLocationNowcast({Key? key}) : super(key: key);

  @override
  _CurrentLocationNowcastState createState() => _CurrentLocationNowcastState();
}

class _CurrentLocationNowcastState extends State<CurrentLocationNowcast> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(190, double.infinity),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Current Location',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          LottieWidget(asset: 'assets/cloudy.json'),
          Text(
            '2 hours nowcast',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
