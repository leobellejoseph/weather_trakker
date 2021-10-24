import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/screens/locations/widgets/location_tile_widget.dart';
import 'package:weather_trakker/widgets/widgets.dart';

class LocationsScreen extends HookWidget {
  static const id = 'locations';

  static Route route() => MaterialPageRoute(
      builder: (context) => LocationsScreen(key: const ValueKey(id)),
      settings: const RouteSettings(name: LocationsScreen.id));
  final scroll = ScrollController();
  LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focus = useFocusNode();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWellButton(
          size: const Size(50, 50),
          child: const Icon(Icons.arrow_back, size: 50, color: Colors.blue),
          onPress: () {
            context.read<NowcastBloc>().add(NowcastFetchEvent());
            Navigator.pop(context);
          }),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.withOpacity(0.8),
              Colors.blue.withOpacity(0.4),
            ],
          ),
        ),
        child: BlocBuilder<NowcastBloc, NowcastState>(
          builder: (context, state) {
            if (state.status == NowcastStateStatus.loading) {
              return const LoadingWidget();
            } else if (state.status == NowcastStateStatus.loadedAll) {
              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 2),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14)),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: Row(
                          children: [
                            Bounceable(
                                onTap: () {
                                  if (controller.text.isNotEmpty) {
                                    context.read<NowcastBloc>().add(
                                        NowcastFilterEvent(
                                            query: controller.text));
                                  }
                                },
                                child: const Icon(Icons.search, size: 35)),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 18),
                                  hintText: 'Search Locations',
                                  border: InputBorder.none,
                                ),
                                enableSuggestions: false,
                                autocorrect: false,
                                cursorColor: Colors.black,
                                focusNode: focus,
                                controller: controller,
                                style: const TextStyle(fontSize: 18),
                                onSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    context.read<NowcastBloc>().add(
                                        NowcastFilterEvent(
                                            query: controller.text));
                                  }
                                },
                              ),
                            ),
                            Bounceable(
                                onTap: () {
                                  controller.clear();
                                  context
                                      .read<NowcastBloc>()
                                      .add(NowcastFetchEvent());
                                  focus.unfocus();
                                },
                                child: const Icon(Icons.clear, size: 35)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 70),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14)),
                          border: Border.all(color: Colors.white, width: 0.5),
                        ),
                        child: ListView.separated(
                          controller: scroll,
                          itemBuilder: (context, index) {
                            final item = state.forecasts[index];

                            return LocationTile(
                                item: item, favorite: item.isFavorite);
                          },
                          itemCount: state.forecasts.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                                  thickness: 0.1, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
