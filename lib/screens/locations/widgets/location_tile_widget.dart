import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/models/models.dart';

class LocationTile extends HookWidget {
  final ForecastModel item;
  final bool favorite;
  const LocationTile({Key? key, required this.item, required this.favorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFavorite = useState<bool>(favorite);
    return ListTile(
      leading: WeatherStatus[item.forecast],
      title: Text(item.area,
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.blue.shade900)),
      subtitle: Text(item.forecast),
      trailing: Bounceable(
        onTap: () {
          final cubit = context.read<FavoritesCubit>();
          if (isFavorite.value) {
            cubit.remove(item);
            isFavorite.value = false;
          } else {
            cubit.add(item);
            isFavorite.value = true;
          }
        },
        child: Icon(
          isFavorite.value ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 40,
        ),
      ),
    );
  }
}
