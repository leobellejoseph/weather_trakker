import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/widgets/widgets.dart';

import 'header_widget.dart';

class TodayCastWidget extends HookWidget {
  const TodayCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var selectedIndex = useState<int>(0);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HeaderWidget(
            title: '24-hour Forecast', subtitle: '12 pm 14 Oct - 12 pm Oct 15'),
        // SizedBox(
        //   height: 50,
        //   width: double.infinity,
        //   child: CupertinoSegmentedControl(
        //     groupValue: selectedIndex.value,
        //     children: const {
        //       0: Text('AFTERNOON'),
        //       1: Text('NIGHT'),
        //       2: Text('MORNING'),
        //     },
        //     onValueChanged: (int index) => selectedIndex.value = index,
        //   ),
        // ),
        Bounceable(
          onTap: () {},
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white60, width: 0.5),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        const LottieWidget(asset: 'assets/thunderstorm.json'),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                const Expanded(
                                  child: ExpandText(
                                    'Thundery showers mainly over northern and western Singapore in the late afternoon.',
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      CupertinoIcons.location_fill,
                                      color: Colors.black54,
                                    ),
                                    Text('ESE 5-15km/h',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.white, thickness: 0.5),
                  SizedBox(
                    height: 35,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '24',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18)),
                                    TextSpan(
                                        text: '\u2103',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '33',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18)),
                                    TextSpan(
                                        text: '\u2103',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                CupertinoIcons.drop,
                                color: Colors.blueAccent,
                              ),
                              Text('55-95%',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
