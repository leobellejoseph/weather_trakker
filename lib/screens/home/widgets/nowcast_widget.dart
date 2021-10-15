import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/screens/home/widgets/header_widget.dart';
import 'package:weather_trakker/screens/home/widgets/nowcast_item.dart';

class NowCastWidget extends StatelessWidget {
  const NowCastWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(
            title: '2-hour Nowcast', subtitle: '5:00 pm to 7:00 pm'),
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.lightBlueAccent,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              NowCastItem(
                  label: 'CURRENT',
                  title: 'Changi',
                  child: Icon(
                    Icons.cloud,
                    size: 60,
                    color: Colors.white,
                  ),
                  subtitle: 'Partly Cloudy'),
              NowCastItem(
                  label: 'FAVORITE',
                  title: 'Ang Mo Kio',
                  child: Icon(
                    Icons.cloud,
                    size: 60,
                    color: Colors.white,
                  ),
                  subtitle: 'Partly Cloudy'),
              NowCastItem(
                  label: 'FAVORITE',
                  title: 'City',
                  child: Icon(
                    Icons.cloud,
                    size: 60,
                    color: Colors.white,
                  ),
                  subtitle: 'Partly Cloudy'),
              NowCastItem(
                  label: 'FAVORITE',
                  title: 'Holland Village',
                  child: Icon(
                    Icons.cloud,
                    size: 60,
                    color: Colors.white,
                  ),
                  subtitle: 'Partly Cloudy'),
            ],
          ),
        ),
      ],
    );
  }
}
