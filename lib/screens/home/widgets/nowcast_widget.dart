import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class NowCastWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const NowCastWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(title: title, subtitle: subtitle),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: Swiper.children(
            pagination: const SwiperPagination(
              margin: EdgeInsets.all(0),
              alignment: Alignment.bottomCenter,
            ),
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              NowCastItem(
                  title: 'Holland Village',
                  child: LottieButton(
                    onTap: () {},
                    asset: 'assets/cloudy.json',
                  ),
                  subtitle: 'Cloudy'),
              NowCastItem(
                  title: 'Sembawang',
                  child: LottieButton(
                      onTap: () {}, asset: 'assets/heavyrain.json'),
                  subtitle: 'Heavy Rain'),
              NowCastItem(
                  title: 'Paya Lebar',
                  child: LottieButton(onTap: () {}, asset: 'assets/windy.json'),
                  subtitle: 'Windy'),
              NowCastItem(
                  title: 'Sengkang',
                  child: LottieButton(onTap: () {}, asset: 'assets/sunny.json'),
                  subtitle: 'Sunny'),
            ],
          ),
        ),
      ],
    );
  }
}
