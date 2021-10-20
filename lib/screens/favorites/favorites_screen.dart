import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/forecast_model.dart';
import 'package:weather_trakker/screens/screens.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  static const id = 'favorites';
  static Route route() => MaterialPageRoute(
        builder: (context) => const FavoritesScreen(key: ValueKey(id)),
        settings: const RouteSettings(name: FavoritesScreen.id),
      );
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWellButton(
        size: const Size(50, 50),
        child: const Icon(Icons.arrow_back, color: Colors.blueAccent, size: 50),
        onPress: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white, width: 0.5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.withOpacity(0.8),
              Colors.blue.withOpacity(0.6),
              Colors.blue.withOpacity(0.5),
              Colors.blue.withOpacity(0.4),
              Colors.blue.withOpacity(0.3),
              Colors.blue.withOpacity(0.2),
            ],
          ),
        ),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state.status == FavoriteStatus.loading) {
              return const LoadingWidget();
            } else if (state.status == FavoriteStatus.no_data) {
              return CenteredTextButton.noFavorites(onPress: () {
                context.read<NowcastBloc>().add(NowcastFetchEvent());
                Navigator.pushNamed(context, LocationsScreen.id);
              });
            } else {
              return SafeArea(
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white, width: 0.5),
                  ),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final item = state.data[index];
                        return _FavoritesItem(
                            title: item.area,
                            child: kWeatherStatusLarge[item.forecast] ??
                                Container(),
                            subtitle: item.forecast);
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.white),
                      itemCount: state.data.length),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _FavoritesItem extends StatelessWidget {
  final String title;
  final Widget child;
  final String subtitle;
  const _FavoritesItem({
    Key? key,
    required this.title,
    required this.child,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(double.infinity, 190),
      child: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              child,
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: InkWellButton(
                size: const Size(50, 50),
                onPress: () {
                  final item = ForecastModel(area: title, forecast: '');
                  context.read<FavoritesCubit>().remove(item);
                },
                child: const Icon(Icons.clear, color: Colors.white, size: 50))),
      ]),
    );
  }
}
