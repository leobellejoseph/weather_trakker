part of 'nowcast_bloc.dart';

abstract class NowcastEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NowcastFetchAllEvent extends NowcastEvent {
  NowcastFetchAllEvent();
  @override
  List<Object?> get props => [];
}

class NowcastFetchEvent extends NowcastEvent {
  NowcastFetchEvent();
  @override
  List<Object?> get props => [];
}

class NowcastFilterEvent extends NowcastEvent {
  final String query;
  NowcastFilterEvent({required this.query});
  @override
  List<Object?> get props => [];
}
