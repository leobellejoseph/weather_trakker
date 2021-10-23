import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_trakker/screens/home/home_screen.dart';

class LocationSettings extends StatefulWidget {
  static const id = 'location';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: LocationSettings.id),
        builder: (context) => const LocationSettings(),
      );
  const LocationSettings({Key? key}) : super(key: key);

  @override
  _LocationSettingsState createState() => _LocationSettingsState();
}

class _LocationSettingsState extends State<LocationSettings>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Navigator.popAndPushNamed(context, HomeScreen.id);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.location_solid,
              color: Colors.yellow.shade700, size: 60),
          TextButton(
              onPressed: () => Geolocator.openAppSettings(),
              child: const Text('Enable Location')),
        ],
      ),
    );
  }
}
