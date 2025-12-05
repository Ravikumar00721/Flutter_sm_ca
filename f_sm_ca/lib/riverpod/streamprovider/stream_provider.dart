import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider= StreamProvider<int>((ref){
  return Stream.periodic(
    Duration(seconds: 1),
      (count)=>count
  );
});

class TimerScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerAsync = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(title: Text("StreamProvider Example")),
      body: Center(
        child: timerAsync.when(
          data: (count) => Text(
            "Seconds: $count",
            style: TextStyle(fontSize: 30),
          ),
          loading: () => CircularProgressIndicator(),
          error: (e, _) => Text("Error: $e"),
        ),
      ),
    );
  }
}