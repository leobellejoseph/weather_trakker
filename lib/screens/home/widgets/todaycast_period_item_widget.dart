import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/forecast_period_model.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';

class TodayCastPeriodItem extends StatelessWidget {
  final ForecastPeriod period;
  const TodayCastPeriodItem({Key? key, required this.period}) : super(key: key);

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
            child: Bounceable(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white60, width: 0.5),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Column(
                            children: [
                              kForecastPeriodWest,
                              kWeatherStatus[period.region.west] ?? Container(),
                              Text(period.region.west,
                                  style: kForecastPeriodStyle),
                            ],
                          ),
                          Column(
                            children: [
                              kForecastPeriodEast,
                              kWeatherStatus[period.region.east] ?? Container(),
                              Text(period.region.east,
                                  style: kForecastPeriodStyle),
                            ],
                          ),
                          Column(
                            children: [
                              kForecastPeriodCentral,
                              kWeatherStatus[period.region.central] ??
                                  Container(),
                              Text(period.region.central,
                                  style: kForecastPeriodStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Column(
                            children: [
                              kForecastPeriodSouth,
                              kWeatherStatus[period.region.south] ??
                                  Container(),
                              Text(period.region.south,
                                  style: kForecastPeriodStyle),
                            ],
                          ),
                          Column(
                            children: [
                              kForecastPeriodNorth,
                              kWeatherStatus[period.region.north] ??
                                  Container(),
                              Text(period.region.north,
                                  style: kForecastPeriodStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        height: 1, color: Colors.white, thickness: 0.5),
                    SizedBox(
                      height: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: const [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '24',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: '\u2103',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '33',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14)),
                                      TextSpan(
                                          text: '\u2103',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  CupertinoIcons.drop,
                                  color: Colors.blueAccent,
                                ),
                                Text('55-95%',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
