import 'package:f_sm_ca/bloc/counter_page/counter_bloc.dart';
import 'package:f_sm_ca/bloc/counter_page/counter_event.dart';
import 'package:f_sm_ca/bloc/counter_page/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget{

  int counter=0;

  @override
  Widget build(BuildContext context) {
    // return BlocListener<CounterBloc,CounterState>(
      // listener: (BuildContext context, state) {
      //   var snack= SnackBar(content: Text("Incremented"),);
      //   ScaffoldMessenger.of(context).showSnackBar(snack);
      // },
      return Scaffold(
        appBar: AppBar(
          title: Text("Counter Screen"),
        ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             BlocConsumer<CounterBloc,CounterState>(builder: (context,state){
               if(state is CounterInitialState){
                 return Text(state.Count.toString(),style: TextStyle(fontSize: 20),);
               }
               else if(state is CounterIncrementState){
                 return Text(state.incCount.toString(),style: TextStyle(fontSize: 20),);
               }
               else if(state is CounterDecrementState) {
                 return Text(
                   state.decCount.toString(), style: TextStyle(fontSize: 20),);
               }
               else{
                 return Container();
               }
             }, listener: (BuildContext context, state) {
               var snack= SnackBar(content: Text("Incremented"),);
               ScaffoldMessenger.of(context).showSnackBar(snack);
             },),

             // BlocBuilder<CounterBloc,CounterState>(
             //   builder: (context,state){
             //     if(state is CounterInitialState){
             //       return Text(state.Count.toString(),style: TextStyle(fontSize: 20),);
             //     }
             //     else if(state is CounterIncrementState){
             //       return Text(state.incCount.toString(),style: TextStyle(fontSize: 20),);
             //     }
             //     else if(state is CounterDecrementState) {
             //       return Text(
             //         state.decCount.toString(), style: TextStyle(fontSize: 20),);
             //     }
             //     else{
             //       return Container();
             //     }
             //   },
             // ),
             SizedBox(height: 16,),

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 ElevatedButton(onPressed: (){
                   BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent(incCount: counter++));
                 }, child: Text("Increment")),
                 ElevatedButton(onPressed: (){
                   BlocProvider.of<CounterBloc>(context).add(CounterDecrementEvent(decCount: counter--));
                 }, child: Text("Decrement"))
               ],
             )
           ],
         ),
       ),
      );
  }
}