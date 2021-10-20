import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fourcast_event.dart';
part 'fourcast_state.dart';

class FourcastBloc extends Bloc<FourcastFetchEvent, FourcastState> {
  FourcastBloc() : super(FourcastState.initial()) {
    on<FourcastFetchEvent>(_FourcastFetchEvent);
  }

  FutureOr<void> _FourcastFetchEvent(
      FourcastFetchEvent event, Emitter<FourcastState> state) async {}
}
