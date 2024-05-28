import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementEven>(_incrementCounter);
    on<DecrementEven>(_decrementCounter);
  }

  void _incrementCounter(IncrementEven even, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrementCounter(DecrementEven even, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter > 0 ? state.counter - 1 : 0));
  }
}
