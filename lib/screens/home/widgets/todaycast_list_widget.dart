import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/widgets/centered_text_button.dart';
import 'package:weather_trakker/widgets/loading_widget.dart';

class TodaycastList extends StatelessWidget {
  const TodaycastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        if (state.status == ForecastStateStatus.noData) {
          return CenteredTextButton.noData(onPress: () {});
        } else if (state.status == ForecastStateStatus.noInternet) {
          return CenteredTextButton.noInternet(onPress: () {});
        } else if (state.status == ForecastStateStatus.loading) {
          return const LoadingWidget();
        } else {
          return Stack(children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  height: 240,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/sgmap.png')),
                    border: Border.all(color: Colors.white60, width: 0.5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            Swiper.children(
              pagination: const SwiperPagination(
                margin: EdgeInsets.all(0),
                alignment: Alignment.bottomCenter,
              ),
              scrollDirection: Axis.horizontal,
              children: [
                // const TodaycastItemGeneral(),
                //TodaycastItem(item: item)
                // for (var item in state.data) TodaycastItemGeneral(item: item),
                for (var item in state.data)
                  for (var period in item.periods)
                    TodaycastMapItem(period: period),
              ],
            ),
          ]);
        }
      },
    );
  }
}
