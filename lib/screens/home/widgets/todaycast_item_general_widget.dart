import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/models/models.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class TodaycastItemGeneral extends StatelessWidget {
  final ForecastItem item;
  const TodaycastItemGeneral({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final period = item.validPeriod;
    final general = item.general;
    final temperature = general.temperature;
    final wind = general.windSpeed;
    final humidity = general.humidity;
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderWidget(
              title: '24-hour Forecast',
              subtitle: '${period.startTime} - ${period.endTime}'),
          Expanded(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        const LottieWidget(asset: 'assets/thunderstorm.json'),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ExpandText(
                                    item.general.forecast,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(CupertinoIcons.wind,
                                        color: Colors.black54),
                                    Text('${wind.low}-${wind.high}km/h',
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
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
                  const Divider(height: 1, color: Colors.white, thickness: 0.5),
                  SizedBox(
                    height: 35,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: temperature.low.toString(),
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14)),
                                    const TextSpan(
                                        text: '\u2103',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14)),
                                  ],
                                ),
                              ),
                              const Text('-'),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: temperature.high.toString(),
                                        style: const TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14)),
                                    const TextSpan(
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
                            children: [
                              const Icon(
                                CupertinoIcons.drop,
                                color: Colors.blueAccent,
                              ),
                              Text('${humidity.low}-${humidity.high}%',
                                  style: const TextStyle(
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
        ],
      ),
    );
  }
}
