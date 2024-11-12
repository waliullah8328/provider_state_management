import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    print("build");
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Counter App"),
        centerTitle: true,
      ),
      body:  Center(child: Consumer<CountProvider>(builder: (context, value, child) {
        return Text(value.count.toString(),style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),);
      },)),
      floatingActionButton: FloatingActionButton(onPressed: (){
        countProvider.add();
      },child: const Icon(Icons.add),),
    );
  }
}
