import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class ImageButton extends StatelessWidget {
  final String asset;
  final Function onPress;
  final Size _size;
  const ImageButton({
    Key? key,
    required this.asset,
    required this.onPress,
    Size? size,
  })  : _size = size ?? const Size(50, 50),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      scaleFactor: 0.6,
      onTap: () => onPress(),
      child: Image.asset(asset, height: _size.height, width: _size.width),
    );
  }
}
