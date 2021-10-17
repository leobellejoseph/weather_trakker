import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/screens/screens.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class SpeedDialWidget extends StatelessWidget {
  const SpeedDialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      childrenButtonSize: 60,
      spaceBetweenChildren: 10,
      overlayColor: Colors.transparent,
      overlayOpacity: 0.5,
      dialRoot: (context, open, children) => ImageButton(
          asset: 'images/mss.png',
          onPress: () => children(),
          size: const Size(60, 60)),
      gradientBoxShape: BoxShape.circle,
      children: [
        SpeedDialChild(
          child: const Icon(CupertinoIcons.heart_fill, size: 35),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.yellow.shade700,
          label: 'Favorites',
          onTap: () => Navigator.pushNamed(context, FavoritesScreen.id),
        ),
        SpeedDialChild(
          child: const Icon(CupertinoIcons.cloud_rain),
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
          label: 'Forecast',
          onTap: () => Navigator.pushNamed(context, ForecastScreen.id),
        ),
        SpeedDialChild(
          child: const Icon(CupertinoIcons.location_solid),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          label: 'Locations',
          visible: true,
          onTap: () {
            final bloc = context.read<NowcastBloc>();
            bloc.add(NowcastFetchEvent());
            Navigator.pushNamed(context, LocationsScreen.id);
          },
        ),
      ],
    );
  }
}
