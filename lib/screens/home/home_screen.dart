import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home';
  static Route route() => MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: HomeScreen.id));
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.withOpacity(0.8),
                      Colors.blue.withOpacity(0.4),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    NowCastWidget(
                        title: '2-hour Nowcast',
                        subtitle: '5:00 pm to 7:00 pm'),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 10),
                      child: Divider(height: 1, color: Colors.white60),
                    ),
                    TodayCastWidget(),
                    // ObservationWidget(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 30,
              child: ImageButton(asset: 'images/mss.png', onPress: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
