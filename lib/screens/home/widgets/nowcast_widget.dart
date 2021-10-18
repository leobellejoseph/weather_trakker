import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class NowCastWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final controller = SwiperController();
  NowCastWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        HeaderWidget(title: title, subtitle: subtitle),
        Expanded(
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state.status != FavoriteStatus.loaded) {
                return const LoadingWidget();
              } else {
                return Swiper.children(
                  controller: controller,
                  pagination: const SwiperPagination(
                    margin: EdgeInsets.all(0),
                    alignment: Alignment.bottomCenter,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: state.data
                      .map((item) => NowCastItem(
                          title: item.area,
                          child: LottieButton(
                            onTap: () {},
                            asset: 'assets/cloudy.json',
                          ),
                          subtitle: 'Cloudy'))
                      .toList(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
