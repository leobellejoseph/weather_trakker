import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'lottie_widget.dart';

class LottieButton extends StatelessWidget {
  final String asset;
  final Function onTap;
  const LottieButton({Key? key, required this.asset, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
        scaleFactor: 0.6,
        onTap: () => onTap(),
        child: LottieWidget(asset: asset));
  }
}
