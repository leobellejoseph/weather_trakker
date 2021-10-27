import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_trakker/bloc/blocs.dart';

class LocationSearch extends HookWidget {
  LocationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focus = useFocusNode();
    final controller = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 2),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14)),
          border: Border.all(color: Colors.white, width: 0.5),
        ),
        child: Row(
          children: [
            Bounceable(
                onTap: () {
                  if (controller.text.isNotEmpty) {
                    final bloc = context.read<NowcastBloc>();
                    bloc.add(NowcastFilterEvent(query: controller.text));
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
                    final bloc = context.read<NowcastBloc>();
                    bloc.add(NowcastFilterEvent(query: value));
                  }
                },
              ),
            ),
            Bounceable(
                onTap: () {
                  controller.clear();
                  context.read<NowcastBloc>().add(NowcastFetchEvent());
                  focus.unfocus();
                },
                child: const Icon(Icons.clear, size: 35)),
          ],
        ),
      ),
    );
  }
}
