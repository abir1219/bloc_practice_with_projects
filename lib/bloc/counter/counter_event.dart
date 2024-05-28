part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent extends Equatable{}

final class IncrementEven extends CounterEvent{
  @override
  List<Object?> get props => [];
}

final class DecrementEven extends CounterEvent{
  @override
  List<Object?> get props => [];
}
