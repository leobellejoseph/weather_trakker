import 'package:app_settings/app_settings.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/widgets/centered_text_button.dart';
import 'package:weather_trakker/widgets/loading_widget.dart';

class TodaycastList extends HookWidget {
  const TodaycastList({Key? key, double? opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visible = useState(1.0);
    return BlocConsumer<ForecastBloc, ForecastState>(
      listener: (context, state) {
        if (state.status == ForecastStateStatus.loading) {
          visible.value = 1.0;
        } else {
          if (state.data[0].periods.isEmpty) {
            visible.value = 0.0;
          }
        }
      },
      builder: (context, state) {
        if (state.status == ForecastStateStatus.noData) {
          return CenteredTextButton.noData(
              onPress: () =>
                  context.read<ForecastBloc>().add(ForecastGeneralEvent()));
        } else if (state.status == ForecastStateStatus.noForecast) {
          return CenteredTextButton.noForecast(
            onPress: () =>
                context.read<ForecastBloc>().add(ForecastGeneralEvent()),
          );
        } else if (state.status == ForecastStateStatus.noInternet) {
          return CenteredTextButton.noInternet(
              onPress: () => AppSettings.openWIFISettings());
        } else if (state.status == ForecastStateStatus.loading) {
          return const LoadingWidget();
        } else {
          return Stack(children: [
            Column(
              children: [
                const SizedBox(height: 35),
                AnimatedOpacity(
                  opacity: visible.value,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    height: 240,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/sgmap.png')),
                      border: Border.all(color: Colors.white60, width: 0.5),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            Swiper.children(
              onIndexChanged: (index) {
                if (index == state.data[0].periods.length) {
                  visible.value = 0.0;
                } else {
                  if (visible.value == 0.0) {
                    visible.value = 1.0;
                  }
                }
              },
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
              ),
              scrollDirection: Axis.horizontal,
              children: [
                for (var item in state.data)
                  for (var period in item.periods)
                    TodaycastMapItem(period: period),
                if (state.fourcasts.isNotEmpty)
                  FourdayForecast(items: state.fourcasts),
              ],
            ),
          ]);
        }
      },
    );
  }
}
