part of 'switch_bloc.dart';

@immutable
class SwitchState extends Equatable {
  late final bool isSwitchEnabled;
  late final double sliderValue;

  SwitchState({this.isSwitchEnabled = true,this.sliderValue = 0.1});

  SwitchState copyWith({bool? isSwitchEnabled,double? sliderValue}){
    return SwitchState(
      isSwitchEnabled: isSwitchEnabled ?? this.isSwitchEnabled,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [isSwitchEnabled,sliderValue];
}