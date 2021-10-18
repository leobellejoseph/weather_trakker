import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_trakker/models/models.dart';
import 'package:weather_trakker/repositories/repositories.dart';

part 'nowcast_event.dart';
part 'nowcast_state.dart';

class NowcastBloc extends Bloc<NowcastEvent, NowcastState> {
  final WeatherRepository repo;
  NowcastBloc({required this.repo}) : super(NowcastState.initial()) {
    on<NowcastFetchEvent>((event, emit) async {
      emit(state.copyWith(newStatus: NowcastStateStatus.loading));
      final data = await repo.fetch2HourForecast();
      emit(state.copyWith(newData: data, newStatus: NowcastStateStatus.loaded));
    });
    on<NowcastFilterEvent>((event, emit) async {
      emit(state.copyWith(newStatus: NowcastStateStatus.loading));
      final data = await repo.fetch2HourForecast();

      emit(state.copyWith(newData: data, newStatus: NowcastStateStatus.loaded));
    });
  }
}
