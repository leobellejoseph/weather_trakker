import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static const id = 'favorites';
  static Route route() => MaterialPageRoute(
        builder: (context) => const FavoritesScreen(key: ValueKey(id)),
        settings: const RouteSettings(name: FavoritesScreen.id),
      );
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Container(),
    );
  }
}
