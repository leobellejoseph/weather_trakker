import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_trakker/screens/screens.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash';
  static Route route() => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: const RouteSettings(name: SplashScreen.id),
      );

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset('images/mss.png')),
            const Align(alignment: Alignment.center, child: _LottieSplash()),
          ],
        ),
      ),
    );
  }
}

class _LottieSplash extends HookWidget {
  const _LottieSplash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();
    return Lottie.asset(
      'assets/splash.json',
      //repeat: true,
      controller: controller,
      onLoaded: (composition) {
        controller
          ..duration = composition.duration
          ..forward()
          ..addListener(() {
            if (controller.status == AnimationStatus.completed) {
              Navigator.popAndPushNamed(context, HomeScreen.id);
            }
          });
      },
    );
  }
}
