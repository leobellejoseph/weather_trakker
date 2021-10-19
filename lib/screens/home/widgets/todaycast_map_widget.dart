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
                    left: 45, right: 55, bottom: 45, top: 0),
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
              // child: Column(
              //   mainAxisSize: MainAxisSize.max,
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: Row(
              //         textBaseline: TextBaseline.alphabetic,
              //         mainAxisSize: MainAxisSize.max,
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         crossAxisAlignment: CrossAxisAlignment.baseline,
              //         children: [
              //           Column(
              //             children: [
              //               kForecastPeriodWest,
              //               kWeatherStatus[period.region.west] ?? Container(),
              //               Text(period.region.west,
              //                   style: kForecastPeriodStyle),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               kForecastPeriodEast,
              //               kWeatherStatus[period.region.east] ?? Container(),
              //               Text(period.region.east,
              //                   style: kForecastPeriodStyle),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               kForecastPeriodCentral,
              //               kWeatherStatus[period.region.central] ??
              //                   Container(),
              //               Text(period.region.central,
              //                   style: kForecastPeriodStyle),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Expanded(
              //       child: Row(
              //         textBaseline: TextBaseline.alphabetic,
              //         mainAxisSize: MainAxisSize.max,
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         crossAxisAlignment: CrossAxisAlignment.baseline,
              //         children: [
              //           Column(
              //             children: [
              //               kForecastPeriodSouth,
              //               kWeatherStatus[period.region.south] ??
              //                   Container(),
              //               Text(period.region.south,
              //                   style: kForecastPeriodStyle),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               kForecastPeriodNorth,
              //               kWeatherStatus[period.region.north] ??
              //                   Container(),
              //               Text(period.region.north,
              //                   style: kForecastPeriodStyle),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     const Divider(
              //         height: 1, color: Colors.white, thickness: 0.5),
              //     SizedBox(
              //       height: 30,
              //       child: Padding(
              //         padding: const EdgeInsets.all(4.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Row(
              //               children: const [
              //                 Text.rich(
              //                   TextSpan(
              //                     children: [
              //                       TextSpan(
              //                           text: '24',
              //                           style: TextStyle(
              //                               color: Colors.green,
              //                               fontWeight: FontWeight.w700,
              //                               fontSize: 14)),
              //                       TextSpan(
              //                           text: '\u2103',
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.normal,
              //                               fontSize: 14)),
              //                     ],
              //                   ),
              //                 ),
              //                 // SizedBox(width: 10),
              //                 Text.rich(
              //                   TextSpan(
              //                     children: [
              //                       TextSpan(
              //                           text: '33',
              //                           style: TextStyle(
              //                               color: Colors.redAccent,
              //                               fontWeight: FontWeight.w700,
              //                               fontSize: 14)),
              //                       TextSpan(
              //                           text: '\u2103',
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.normal,
              //                               fontSize: 14)),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               children: const [
              //                 Icon(
              //                   CupertinoIcons.drop,
              //                   color: Colors.blueAccent,
              //                 ),
              //                 Text('55-95%',
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w700,
              //                         fontSize: 14)),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
