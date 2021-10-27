import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/screens/locations/widgets/location_search_widget.dart';
import 'package:weather_trakker/screens/locations/widgets/location_tile_widget.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class LocationsScreen extends HookWidget {
  static const id = 'locations';

  static Route route() => MaterialPageRoute(
      builder: (context) => LocationsScreen(key: const ValueKey(id)),
      settings: const RouteSettings(name: LocationsScreen.id));
  final scroll = ScrollController();
  LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWellButton(
          size: const Size(50, 50),
          child: const Icon(Icons.arrow_back, size: 50, color: Colors.blue),
          onPress: () => Navigator.pop(context)),
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
          builder: (context, state) {
            if (state.status == NowcastStateStatus.loadingAll) {
              return const LoadingWidget();
            } else if (state.status == NowcastStateStatus.loadedAll) {
              return SafeArea(
                child: Column(
                  children: [
                    LocationSearch(),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 70),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14)),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: ListView.separated(
                          controller: scroll,
                          itemBuilder: (context, index) {
                            final item = state.forecasts[index];
                            return LocationTile(
                                item: item, favorite: item.isFavorite);
                          },
                          itemCount: state.forecasts.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                                  thickness: 0.1, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state.status == NowcastStateStatus.noData) {
              return CenteredTextButton.noData(
                onPress: () =>
                    context.read<NowcastBloc>().add(NowcastFetchAllEvent()),
              );
            } else if (state.status == NowcastStateStatus.noInternet) {
              return CenteredTextButton.noInternet(
                onPress: () =>
                    context.read<NowcastBloc>().add(NowcastFetchAllEvent()),
              );
            } else {
              return CenteredTextButton.error(
                onPress: () =>
                    context.read<NowcastBloc>().add(NowcastFetchAllEvent()),
              );
            }
          },
        ),
      ),
    );
  }
}
