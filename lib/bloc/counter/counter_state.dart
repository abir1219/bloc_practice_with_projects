part of 'counter_bloc.dart';

class CounterState extends Equatable {
  late int counter;

  CounterState({this.counter = 0});

  CounterState copyWith({int? counter}){
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}


