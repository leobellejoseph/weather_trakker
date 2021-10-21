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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HeaderWidget(
            title: period.time.description,
            subtitle: '${period.time.start} - ${period.time.end}'),
        SizedBox(
          height: 240,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 55, right: 75, bottom: 70, top: 0),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Tooltip(
                        message: 'West: ${period.region.west}',
                        child:
                            kWeatherStatus[period.region.west] ?? Container())),
                Align(
                    alignment: Alignment.centerRight,
                    child: Tooltip(
                        message: 'East: ${period.region.east}',
                        child:
                            kWeatherStatus[period.region.east] ?? Container())),
                Align(
                    alignment: Alignment.center,
                    child: Tooltip(
                        message: 'Central: ${period.region.central}',
                        child: kWeatherStatus[period.region.central] ??
                            Container())),
                Align(
                    alignment: Alignment.topCenter,
                    child: Tooltip(
                        message: 'North: ${period.region.north}',
                        child: kWeatherStatus[period.region.north] ??
                            Container())),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Tooltip(
                        message: 'South: ${period.region.south}',
                        child: kWeatherStatus[period.region.south] ??
                            Container())),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
