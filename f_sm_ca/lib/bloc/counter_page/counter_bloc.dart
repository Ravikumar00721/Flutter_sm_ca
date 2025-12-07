import 'package:f_sm_ca/bloc/counter_page/counter_event.dart';
import 'package:f_sm_ca/bloc/counter_page/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(CounterInitialState(Count: 0)){

    on<CounterIncrementEvent>((event,emit){
      emit(CounterIncrementState(incCount: event.incCount!+1));
      });

    on<CounterDecrementEvent>((event,emit){
      emit(CounterDecrementState(decCount: event.decCount!-1 ));
    });
  }
  
}