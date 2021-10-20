import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';

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
        floatingActionButton: const SpeedDialWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.withOpacity(0.8),
                    Colors.blue.withOpacity(0.6),
                    Colors.blue.withOpacity(0.5),
                    Colors.blue.withOpacity(0.4),
                    Colors.blue.withOpacity(0.2),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SizedBox(
                      height: 240,
                      child: NowCastWidget(title: '2-hour Nowcast'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 10),
                      child: Divider(height: 0.5, color: Colors.blueAccent),
                    ),
                    SizedBox(
                        height: 310,
                        width: double.infinity,
                        child: TodaycastList()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
