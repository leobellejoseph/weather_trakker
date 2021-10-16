import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/screens/home/widgets/header_widget.dart';
import 'package:weather_trakker/screens/home/widgets/nowcast_item.dart';
import 'package:weather_trakker/widgets/lottie_button.dart';

class NowCastWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const NowCastWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Column(
        children: [
          HeaderWidget(title: title, subtitle: subtitle),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                NowCastItem(
                    title: 'Holland Village',
                    child:
                        LottieButton(onTap: () {}, asset: 'assets/cloudy.json'),
                    subtitle: 'Cloudy'),
                NowCastItem(
                    title: 'Sembawang',
                    child: LottieButton(
                        onTap: () {}, asset: 'assets/heavyrain.json'),
                    subtitle: 'Heavy Rain'),
                NowCastItem(
                    title: 'Paya Lebar',
                    child:
                        LottieButton(onTap: () {}, asset: 'assets/windy.json'),
                    subtitle: 'Windy'),
                NowCastItem(
                    title: 'Sengkang',
                    child:
                        LottieButton(onTap: () {}, asset: 'assets/sunny.json'),
                    subtitle: 'Sunny'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
