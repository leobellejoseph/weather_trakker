import 'package:flutter/material.dart';
import 'package:weather_trakker/widgets/lottie_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueAccent.withOpacity(0.8),
            Colors.blueAccent.withOpacity(0.4),
          ],
        ),
      ),
      height: double.infinity,
      width: double.infinity,
      child: const LottieWidget(asset: 'assets/splash.json'),
    );
  }
}
