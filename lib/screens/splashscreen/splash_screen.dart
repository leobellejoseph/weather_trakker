import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    bool hasNowcastCompleted = false;
    bool hasForecastCompleted = false;
    return MultiBlocListener(
      listeners: [
        BlocListener<NowcastBloc, NowcastState>(listener: (context, state) {
          hasNowcastCompleted = state.status != NowcastStateStatus.initial;
          if (hasNowcastCompleted && hasForecastCompleted) {
            Navigator.popAndPushNamed(context, HomeScreen.id);
          }
        }),
        BlocListener<ForecastBloc, ForecastState>(listener: (context, state) {
          hasForecastCompleted = state.status != ForecastStateStatus.initial;
          if (hasForecastCompleted && hasNowcastCompleted) {
            Navigator.popAndPushNamed(context, HomeScreen.id);
          }
        }),
      ],
      child: Lottie.asset(
        'assets/splash.json',
        controller: controller,
        onLoaded: (composition) {
          controller
            ..duration = composition.duration
            ..repeat();
        },
      ),
    );
  }
}
