import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends HookWidget {
  final String _asset;
  final Size _size;
  const LottieWidget({Key? key, required String asset, Size? size})
      : _asset = asset,
        _size = size ?? const Size(120, 120),
        super(key: key);
  factory LottieWidget.noData() =>
      const LottieWidget(asset: 'assets/sunny.json');
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();
    return Lottie.asset(
      _asset,
      height: _size.height,
      width: _size.width,
      controller: controller,
      onLoaded: (composition) {
        controller
          ..duration = composition.duration
          ..repeat();
      },
    );
  }
}
