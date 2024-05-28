import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch/switch_bloc.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Switch Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitchEnabled,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(ChangeSwitchEvent(
                            switchStatus: value));
                      },
                    );
                  },
                )
              ],
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Slider(
                      value: state.sliderValue,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                            ChangeSliderEvent(sliderValue: value));
                      },
                    ),
                    Center(
                      child: Text(state.sliderValue.toStringAsFixed(1)),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
