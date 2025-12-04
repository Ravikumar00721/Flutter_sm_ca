import 'package:f_sm_ca/riverpod/stateprovider/state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenSP extends  ConsumerStatefulWidget{
  const HomeScreenSP({super.key});

  @override
  ConsumerState<HomeScreenSP> createState() => _HomeScreenSPState();
}

class _HomeScreenSPState extends ConsumerState<HomeScreenSP> {
  @override
  Widget build(BuildContext context) {

    final counter=ref.watch(counterProvider);
    final isDark=ref.watch(colorProvider);
    final textSize=ref.watch(textSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
        backgroundColor: isDark?Colors.black:Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: $counter',
              style: TextStyle(fontSize: textSize),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  ref.read(counterProvider.notifier).state++;
                }, child: Text("Increment")),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                  ref.read(counterProvider.notifier).state--;
                }, child: Text("Decrement")),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(value: isDark, onChanged: (val){
                  ref.read(colorProvider.notifier).state=val;
                })
              ],
            ),
            SizedBox(height: 20,),
            Slider(
                value: textSize,
                min: 10,
                max: 50,
                divisions: 8,
                onChanged: (val){
              ref.read(textSizeProvider.notifier).state=val;
            })
          ]
        ),
      ),
    );
  }
}
