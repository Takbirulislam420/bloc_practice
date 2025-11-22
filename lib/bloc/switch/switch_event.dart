part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent {}

class SliderNotification extends SwitchEvent {
  final double slider;

  const SliderNotification({required this.slider});

  @override
  List<Object> get props => [slider];
}
