import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_trakker/models/forecast_general_model.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';

class FourdayForecast extends StatelessWidget {
  final List<ForecastGeneral> items;
  const FourdayForecast({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HeaderWidget(
          title: '4 Days Forecast',
          subtitle: '${items.first.forecastDate} - ${items.last.forecastDate}',
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(1),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.65,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 1, right: 1, top: 2, bottom: 2),
                    child: FourcastItem(item: item),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
