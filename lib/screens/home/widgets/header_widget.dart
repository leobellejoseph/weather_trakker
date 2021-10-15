import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color _color;
  const HeaderWidget(
      {Key? key, required this.title, required this.subtitle, Color? color})
      : _color = color ?? Colors.white,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      color: _color,
      padding: const EdgeInsets.all(6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold))),
            Center(
                child: Text(subtitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12))),
          ],
        ),
      ),
    );
  }
}
