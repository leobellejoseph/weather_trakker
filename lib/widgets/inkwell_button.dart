import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  final Widget child;
  final Function onPress;
  final Size _size;
  final Color _backgroundColor;
  final Color _highlightColor;
  final ShapeBorder _shapeBorder;
  final BorderRadius _borderRadius;
  InkWellButton({
    Key? key,
    required this.child,
    required this.onPress,
    Size? size,
    Color? backgroundColor,
    Color? highlightColor,
    ShapeBorder? shapeBorder,
    BorderRadius? borderRadius,
  })  : _size = size ?? const Size(30, 30),
        _backgroundColor = backgroundColor ?? Colors.transparent,
        _highlightColor = highlightColor ?? Colors.lightBlueAccent,
        _shapeBorder = shapeBorder ?? const CircleBorder(),
        _borderRadius = borderRadius ?? BorderRadius.circular(0),
        super(key: key);

  factory InkWellButton.image(
          {required String asset, required Function onPress}) =>
      InkWellButton(child: Image.asset(asset), onPress: onPress);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox.fromSize(
        size: _size,
        child: Material(
          color: _backgroundColor,
          shape: _shapeBorder,
          borderRadius: _shapeBorder is CircleBorder ? null : _borderRadius,
          child: InkWell(
            borderRadius: _shapeBorder is CircleBorder ? null : _borderRadius,
            onTap: () => onPress(),
            highlightColor: _highlightColor,
            customBorder: _shapeBorder,
            child: child,
          ),
        ),
      ),
    );
  }
}
