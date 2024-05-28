part of 'switch_bloc.dart';

@immutable
sealed class SwitchEvent extends Equatable {}

final class ChangeSwitchEvent extends SwitchEvent {
  final bool switchStatus;

  ChangeSwitchEvent({required this.switchStatus});

  @override
  List<Object?> get props => [switchStatus];
}

final class ChangeSliderEvent extends SwitchEvent {
  final double sliderValue;

  ChangeSliderEvent({required this.sliderValue});

  @override
  List<Object?> get props => [sliderValue];
}
