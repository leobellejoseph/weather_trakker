import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/screens/locations/widgets/location_tile_widget.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWellButton(
        size: const Size(50, 50),
        child: const Icon(Icons.arrow_back, size: 50, color: Colors.blue),
        onPress: () {
          Navigator.pop(context);
        },
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
              return SafeArea(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white, width: 0.5),
                  ),
                  child: BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (_, favorites) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final item = state.data.items[0].forecasts[index];
                            bool isFavorite = favorites.data
                                .where((i) => i.area == item.area)
                                .isNotEmpty;
                            return LocationTile(
                                item: item, favorite: isFavorite);
                          },
                          itemCount: state.data.items[0].forecasts.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                                  thickness: 0.1, color: Colors.white));
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
