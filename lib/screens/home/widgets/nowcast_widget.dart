import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class NowCastWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  const NowCastWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);

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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        HeaderWidget(title: widget.title, subtitle: widget.subtitle),
        Expanded(
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state.status == FavoriteStatus.loading) {
                return const LoadingWidget();
              } else if (state.status == FavoriteStatus.no_internet) {
                return CenteredTextButton.noInternet(
                  onPress: () {},
                );
              } else if (state.status == FavoriteStatus.no_data) {
                return CenteredTextButton.noData(onPress: () {});
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
                          child: const LottieWidget(
                            asset: 'assets/cloudy.json',
                            size: Size(160, 160),
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
