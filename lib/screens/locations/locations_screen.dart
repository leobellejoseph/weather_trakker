import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/screens/screens.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class LocationsScreen extends HookWidget {
  static const id = 'locations';

  static Route route() => MaterialPageRoute(
      builder: (context) => const LocationsScreen(key: ValueKey(id)),
      settings: const RouteSettings(name: LocationsScreen.id));

  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWellButton(
            child: const Icon(Icons.arrow_back_ios),
            onPress: () => Navigator.popAndPushNamed(context, HomeScreen.id)),
        title: const Text('Locations'),
      ),
      body: BlocBuilder<NowcastBloc, NowcastState>(
        builder: (context, state) {
          if (state.status == NowcastStateStatus.loading) {
            return const LoadingWidget();
          } else {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blueAccent.withOpacity(0.8),
                    Colors.blueAccent.withOpacity(0.4),
                  ],
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = state.data.items[0].forecasts[index];
                    return ListTile(
                      leading: WeatherStatus[item.forecast],
                      title: Text(item.area,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.blue.shade900)),
                      subtitle: Text(item.forecast),
                      trailing: InkWellButton(
                        size: const Size(40, 40),
                        onPress: () {},
                        child: const Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 40,
                        ),
                      ),
                    );
                  },
                  itemCount: state.data.items[0].forecasts.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(thickness: 0.1, color: Colors.white)),
            );
          }
        },
      ),
    );
  }
}
