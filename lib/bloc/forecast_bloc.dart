import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastFetchEvent, ForecastState> {
  ForecastBloc() : super(ForecastInitial()) {
    on<ForecastFetchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
