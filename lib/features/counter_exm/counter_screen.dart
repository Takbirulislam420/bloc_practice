import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_with_bloc/bloc/counter/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // bloc builder for update ui
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  // display state variable
                  state.counter.toString(),
                  style: TextStyle(fontSize: 60),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Click event with Bloc
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: Text("Decrement"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Click event with Bloc
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: Text("Increment"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
