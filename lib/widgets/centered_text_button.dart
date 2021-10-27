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
  factory CenteredTextButton.noFavorites({required Function onPress}) =>
      CenteredTextButton(
        title: 'Favorites',
        child: Center(
            child: Icon(
          Icons.star,
          color: Colors.yellow.shade600,
          size: 100,
        )),
        onPress: onPress,
        buttonText: 'Click to Add Favorites',
      );
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

  factory CenteredTextButton.error({required Function onPress}) =>
      CenteredTextButton(
          title: 'Unexpected Error',
          child: const Center(
              child: Icon(Icons.error, color: Colors.redAccent, size: 50)),
          onPress: onPress,
          buttonText: 'Refresh');

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

  factory CenteredTextButton.noForecast({required Function onPress}) =>
      CenteredTextButton(
        title: 'Unable to fetch forecast data',
        child: const Center(
            child: Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 50,
        )),
        onPress: onPress,
        buttonText: 'Tap to Refresh',
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
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18)),
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
