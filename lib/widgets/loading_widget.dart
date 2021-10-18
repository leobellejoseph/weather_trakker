import 'package:flutter/material.dart';
import 'package:weather_trakker/widgets/lottie_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: LottieWidget(asset: 'assets/splash.json'),
    );
  }
}
