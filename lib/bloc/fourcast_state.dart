part of 'fourcast_bloc.dart';

enum FourcastStateStatus { initial, loading, loaded, error }

class FourcastState extends Equatable {
  const FourcastState();
  factory FourcastState.initial() => const FourcastState();
  @override
  List<Object> get props => [];
}
