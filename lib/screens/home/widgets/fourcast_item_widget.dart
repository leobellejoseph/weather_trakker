import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/helpers/constants.dart';
import 'package:weather_trakker/models/models.dart';

class FourcastItem extends StatelessWidget {
  final ForecastGeneral item;
  const FourcastItem({Key? key, required this.item}) : super(key: key);

  Widget _getWeatherStatus(String keyword) {
    String status = 'Cloudy';
    for (var item in kWeatherStatus.entries) {
      if (keyword.contains(item.key.toLowerCase())) {
        status = item.key;
        break;
      }
    }

    return kWeatherStatus[status] ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 2, right: 2, top: 6, bottom: 2),
      decoration: BoxDecoration(
        //  color: Colors.blue,
        border: Border.all(color: Colors.white, width: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Text(item.forecastDate,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent.shade700)),
          ),
          const Divider(thickness: 0.5, height: 5),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  _getWeatherStatus(item.forecast),
                  Expanded(
                    child: Text(item.forecast,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.thermometer,
                    color: Colors.blueAccent,
                    size: 14,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: item.temperature.low.toString(),
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 12)),
                        const TextSpan(
                            text: '\u2103',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Text('-'),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: item.temperature.high.toString(),
                            style: const TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 12)),
                        const TextSpan(
                            text: '\u2103',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12)),
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
                    size: 14,
                  ),
                  Text('${item.humidity.low}-${item.humidity.high}%',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w700,
                          fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
