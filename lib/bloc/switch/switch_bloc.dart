import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderNotification>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification events,Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

    void _slider(SliderNotification events,Emitter<SwitchState> emit){
    emit(state.copyWith(slider: events.slider));

  }

}
