import 'package:clean_architecture_flutter/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(count: state.count - 1));
    });
  }
}
