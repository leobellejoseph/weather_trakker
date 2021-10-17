import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color _color;
  const HeaderWidget(
      {Key? key, required this.title, required this.subtitle, Color? color})
      : _color = color ?? Colors.transparent,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      color: _color,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Center(
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 14))),
          Center(
              child: Text(subtitle,
                  style: const TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.w500,
                      fontSize: 12))),
        ],
      ),
    );
  }
}
