import 'package:bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text("${state.counter}", style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold,
                    fontSize: 50
                ),);
              },
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(IncrementEven());
              }, child: const Text("Increment",),),
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(DecrementEven());
              }, child: const Text("Decrement",),),
            ],
          )
        ],
      ),
    );
  }
}
