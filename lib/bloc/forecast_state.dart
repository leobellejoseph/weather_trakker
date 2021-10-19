part of 'forecast_bloc.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();
}

class ForecastInitial extends ForecastState {
  @override
  List<Object> get props => [];
}
