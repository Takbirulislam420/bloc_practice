import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_with_bloc/bloc/switch/switch_bloc.dart';

class SwitchExmple extends StatefulWidget {
  const SwitchExmple({super.key});

  @override
  State<SwitchExmple> createState() => _SwitchExmpleState();
}

class _SwitchExmpleState extends State<SwitchExmple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Notifications"),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  //print("Switch value");
                  return Switch(
                    value: state.isSwitch,
                    onChanged: (newValue) {
                      context.read<SwitchBloc>().add(
                        EnableOrDisableNotification(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              //print("Container value");
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  // ignore: deprecated_member_use
                  color: Colors.red.withOpacity(state.slider),
                ),
              );
            },
          ),
          SizedBox(height: 50),
          //
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              //print("slider value");
              return Slider(value: state.slider, onChanged: (value) {
                context.read<SwitchBloc>().add(SliderNotification(slider: value));
              });
            },
          ),
        ],
      ),
    );
  }
}
