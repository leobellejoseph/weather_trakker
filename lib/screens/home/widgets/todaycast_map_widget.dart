import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/models.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';

class TodaycastMapItem extends StatelessWidget {
  final ForecastPeriod period;
  const TodaycastMapItem({Key? key, required this.period}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderWidget(
              title: period.time.description,
              subtitle: '${period.time.start} - ${period.time.end}'),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 70, bottom: 75, top: 10),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                            kWeatherStatus[period.region.west] ?? Container()),
                    Align(
                        alignment: Alignment.centerRight,
                        child:
                            kWeatherStatus[period.region.east] ?? Container()),
                    Align(
                        alignment: Alignment.center,
                        child: kWeatherStatus[period.region.central] ??
                            Container()),
                    Align(
                        alignment: Alignment.topCenter,
                        child:
                            kWeatherStatus[period.region.north] ?? Container()),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child:
                            kWeatherStatus[period.region.south] ?? Container()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
