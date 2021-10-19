import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/screens/screens.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class NowCastWidget extends StatefulWidget {
  final String title;
  const NowCastWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<NowCastWidget> createState() => _NowCastWidgetState();
}

class _NowCastWidgetState extends State<NowCastWidget>
    with WidgetsBindingObserver {
  final controller = SwiperController();
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<FavoritesCubit>().fetch();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state.status == FavoriteStatus.loading) {
          return const LoadingWidget();
        } else if (state.status == FavoriteStatus.no_internet) {
          return CenteredTextButton.noInternet(
            onPress: () {},
          );
        } else if (state.status == FavoriteStatus.no_data) {
          return CenteredTextButton.noFavorites(onPress: () {
            context.read<NowcastBloc>().add(NowcastFetchEvent());
            Navigator.pushNamed(context, LocationsScreen.id);
          });
        } else {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              HeaderWidget(title: widget.title, subtitle: state.period),
              Expanded(
                child: Swiper.children(
                  controller: controller,
                  pagination: const SwiperPagination(
                    margin: EdgeInsets.all(0),
                    alignment: Alignment.bottomCenter,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: state.data
                      .map((item) => NowCastItem(
                          title: item.area,
                          child:
                              kWeatherStatusLarge[item.forecast] ?? Container(),
                          subtitle: item.forecast))
                      .toList(),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
