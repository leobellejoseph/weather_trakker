import 'package:app_settings/app_settings.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/screens/screens.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class NowCastWidget extends StatelessWidget {
  final String title;

  const NowCastWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scroll = SwiperController();
    return BlocBuilder<NowcastBloc, NowcastState>(
      builder: (context, state) {
        if (state.status == NowcastStateStatus.loading) {
          return const LoadingWidget();
        } else if (state.status == NowcastStateStatus.noInternet) {
          return CenteredTextButton.noInternet(
            onPress: () => AppSettings.openWIFISettings(),
          );
        } else if (state.status == NowcastStateStatus.noData) {
          return CenteredTextButton.noFavorites(onPress: () {
            context.read<NowcastBloc>().add(NowcastFetchEvent());
            Navigator.pushNamed(context, LocationsScreen.id);
          });
        } else if (state.status == NowcastStateStatus.loaded) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              HeaderWidget(title: title, subtitle: state.period),
              Expanded(
                child: Swiper.children(
                  controller: scroll,
                  pagination: const SwiperPagination(
                    margin: EdgeInsets.all(0),
                    alignment: Alignment.bottomCenter,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: state.forecasts
                      .map((item) => NowCastItem(
                          title: item.label,
                          child:
                              kWeatherStatusLarge[item.forecast] ?? Container(),
                          subtitle: item.forecast))
                      .toList(),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
