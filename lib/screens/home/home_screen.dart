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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade500,
          title: Center(
            child: Text('My Locations',
                style: TextStyle(color: Colors.cyan.shade700)),
          ),
          leading: InkWellButton.image(
              asset: 'images/mss.png',
              onPress: () {
                print('test');
              }),
          actions: [
            InkWellButton(
              child: const Icon(Icons.settings, size: 40, color: Colors.blue),
              onPress: () {},
              size: const Size(40, 40),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            NowCastWidget(),
            ObservationWidget(),
          ],
        ),
      ),
    );
  }
}
