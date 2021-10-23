import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_trakker/bloc/blocs.dart';
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
          ..addListener(() async {
            if (controller.status == AnimationStatus.completed) {
              context.read<NowcastBloc>().add(NowcastFetchEvent());
              context.read<ForecastBloc>().add(ForecastGeneralEvent());
              final enabledLocation =
                  await Geolocator.isLocationServiceEnabled();
              if (enabledLocation) {
                final permission = await Geolocator.checkPermission();
                final hasPermission =
                    (permission == LocationPermission.always ||
                        permission == LocationPermission.whileInUse);
                if (hasPermission) {
                  Navigator.popAndPushNamed(context, HomeScreen.id);
                } else {
                  final permission = await Geolocator.requestPermission();
                  final hasPermission =
                      (permission == LocationPermission.always ||
                          permission == LocationPermission.whileInUse);
                  if (hasPermission) {
                    Navigator.popAndPushNamed(context, HomeScreen.id);
                  }
                }
              } else {
                Geolocator.requestPermission();
              }
            }
          });
      },
    );
  }
}
