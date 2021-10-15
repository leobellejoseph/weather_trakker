import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/screens/home/widgets/header_widget.dart';

class ObservationWidget extends StatelessWidget {
  const ObservationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HeaderWidget(title: 'Current Observations', subtitle: '5:20 pm'),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300, border: Border.all(width: 0.2)),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                child: Text('Changi',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.thermometer, size: 20),
                    Text('30.0 \u2103',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.cloud_rain, size: 20),
                    Text('0.0mm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.wind, size: 20),
                    Text('25.2km/h',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.drop_fill, size: 20),
                    Text('62.0%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300, border: Border.all(width: 0.2)),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                child: Text('Ang Mo Kio',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.thermometer, size: 20),
                    Text('30.0 \u2103',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.cloud_rain, size: 20),
                    Text('0.0mm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.wind, size: 20),
                    Text('25.2km/h',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.drop_fill, size: 20),
                    Text('62.0%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300, border: Border.all(width: 0.2)),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                child: Text('Holland Village',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.thermometer, size: 20),
                    Text('30.0 \u2103',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.cloud_rain, size: 20),
                    Text('0.0mm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.wind, size: 20),
                    Text('25.2km/h',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.drop_fill, size: 20),
                    Text('62.0%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300, border: Border.all(width: 0.2)),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(
                child: Text('City',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.thermometer, size: 20),
                    Text('30.0 \u2103',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.cloud_rain, size: 20),
                    Text('0.0mm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.wind, size: 20),
                    Text('25.2km/h',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(CupertinoIcons.drop_fill, size: 20),
                    Text('62.0%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
