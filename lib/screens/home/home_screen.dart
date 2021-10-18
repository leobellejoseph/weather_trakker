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
                    Colors.blue.withOpacity(0.4),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 280,
                      child: NowCastWidget(
                          title: '2-hour Nowcast',
                          subtitle: '5:00 pm to 7:00 pm'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 10),
                      child: Divider(height: 0.5, color: Colors.blueAccent),
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: size.height - 450,
                    //   child: CustomScrollView(
                    //     slivers: [
                    //       SliverToBoxAdapter(child: Forecast24Hours()),
                    //       SliverToBoxAdapter(child: Forecast24Hours()),
                    //       SliverToBoxAdapter(child: Forecast24Hours()),
                    //     ],
                    //   ),
                    // ),
                    Forecast24Hours(),
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
