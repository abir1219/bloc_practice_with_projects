import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<ChangeSwitchEvent>(_changeSwitch);
    on<ChangeSliderEvent>(_changeSlider);
  }

  void _changeSwitch(ChangeSwitchEvent event,Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitchEnabled: event.switchStatus));
  }

  void _changeSlider(ChangeSliderEvent event,Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.sliderValue));
  }

}
