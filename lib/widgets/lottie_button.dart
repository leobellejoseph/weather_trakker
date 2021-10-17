import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'lottie_widget.dart';

class LottieButton extends StatelessWidget {
  final String asset;
  final Function onTap;
  final Size _size;
  const LottieButton(
      {Key? key, required this.asset, required this.onTap, Size? size})
      : _size = size ?? const Size(150, 150),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
        scaleFactor: 0.6,
        onTap: () => onTap(),
        child: LottieWidget(asset: asset, size: _size));
  }
}
