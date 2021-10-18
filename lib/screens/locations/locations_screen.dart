import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/screens/locations/widgets/location_tile_widget.dart';
import 'package:weather_trakker/screens/screens.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class LocationsScreen extends HookWidget {
  static const id = 'locations';

  static Route route() => MaterialPageRoute(
      builder: (context) => LocationsScreen(key: ValueKey(id)),
      settings: const RouteSettings(name: LocationsScreen.id));

  LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWellButton(
          child: const Icon(Icons.arrow_back_ios),
          onPress: () {
            context.read<FavoritesCubit>().fetch();
            Navigator.popAndPushNamed(context, HomeScreen.id);
          },
        ),
        title: const Text('Locations'),
      ),
      body: Container(
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
        child: BlocBuilder<NowcastBloc, NowcastState>(
          builder: (_, state) {
            if (state.status == NowcastStateStatus.loading) {
              return const LoadingWidget();
            } else {
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (_, favorites) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final item = state.data.items[0].forecasts[index];
                          bool isFavorite = favorites.data
                              .where((i) => i.area == item.area)
                              .isNotEmpty;
                          return LocationTile(item: item, favorite: isFavorite);
                        },
                        itemCount: state.data.items[0].forecasts.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(thickness: 0.1, color: Colors.white));
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
