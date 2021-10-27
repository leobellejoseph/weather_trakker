// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bounceable/flutter_bounceable.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:weather_trakker/helpers/helpers.dart';
// import 'package:weather_trakker/models/models.dart';
// import 'package:weather_trakker/widgets/widgets.dart';
//
// import 'header_widget.dart';
//
// class TodaycastItem extends HookWidget {
//   final ForecastItem item;
//   const TodaycastItem({Key? key, required this.item}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 2, right: 2, bottom: 10.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           HeaderWidget(
//               title: '24 Hours Forecast',
//               subtitle:
//                   '${item.validPeriod.startTime} - ${item.validPeriod.endTime}'),
//           Expanded(
//             child: Bounceable(
//               onTap: () {},
//               child: Container(
//                 margin: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white60, width: 0.5),
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(item.general.forecast,
//                               style: kForecastItemLabel),
//                           const LottieWidget(asset: 'assets/thunderstorm.json'),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text('Humidity: '),
//                               Text(
//                                   '${item.general.humidity.low} -${item.general.humidity.high} ')
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Text('Temperature: '),
//                               Text(
//                                   '${item.general.temperature.low} -${item.general.temperature.high} ')
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Text('WindSpeed: '),
//                               Text(
//                                   '${item.general.windSpeed.low} -${item.general.windSpeed.high} ')
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Text('Wind Direction: '),
//                               Text(item.general.windSpeed.direction),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
