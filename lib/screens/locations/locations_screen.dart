import 'package:flutter/material.dart';

class LocationsScreen extends StatelessWidget {
  static const id = 'locations';
  static Route route() => MaterialPageRoute(
        builder: (context) => const LocationsScreen(key: ValueKey(id)),
        settings: const RouteSettings(name: LocationsScreen.id),
      );
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: Container(),
    );
  }
}
