part of 'forecast_bloc.dart';

abstract class ForecastEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForecastGeneralEvent extends ForecastEvent {
  ForecastGeneralEvent();
}

class ForecastPeriodEvent extends ForecastEvent {
  ForecastPeriodEvent();
}
