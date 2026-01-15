import 'package:clean_architecture_flutter/counter_bloc.dart';
import 'package:clean_architecture_flutter/counter_event.dart';
import 'package:clean_architecture_flutter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App Bloc', style: TextStyle(fontSize: 18)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(state.count.toString());
            },
          ),
          Text('Press + for increment and - for decrement'),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementEvent());
                },
                child: Icon(Icons.plus_one),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementEvent());
                },
                child: Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
