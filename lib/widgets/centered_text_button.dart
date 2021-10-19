import 'package:flutter/material.dart';

class CenteredTextButton extends StatelessWidget {
  final String title;
  final Widget child;
  final Function onPress;
  final String buttonText;
  const CenteredTextButton(
      {Key? key,
      required this.title,
      required this.child,
      required this.onPress,
      required this.buttonText})
      : super(key: key);
  factory CenteredTextButton.noData({required Function onPress}) =>
      CenteredTextButton(
        title: 'No Data',
        child: const Center(
            child: Icon(
          Icons.info,
          color: Colors.white,
          size: 50,
        )),
        onPress: onPress,
        buttonText: 'Refresh',
      );

  factory CenteredTextButton.noInternet({required Function onPress}) =>
      CenteredTextButton(
        title: 'No Internet',
        child: const Center(
            child: Icon(
          Icons.signal_wifi_connected_no_internet_4_rounded,
          color: Colors.white,
          size: 50,
        )),
        onPress: onPress,
        buttonText: 'Open Connection Settings',
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blue.shade600,
                    fontSize: 25)),
            TextButton(
              style: TextButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () => onPress(),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
