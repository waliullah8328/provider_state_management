
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/calulator_provider.dart';

class SimpleCalculator extends StatelessWidget {
   SimpleCalculator({super.key});
   final TextEditingController _number1TEController = TextEditingController();
   final TextEditingController _number2TEController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<CalculatorProvider>(context,listen: false);
    print("build");
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Simple Calculator",style: TextStyle(color: Colors.white),),centerTitle: true,),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextFormField(
              controller: _number1TEController,
              decoration: InputDecoration(
                hintText: "Enter first Number",
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 15,
                    color: Colors.white
                  )
                )
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _number2TEController,
              decoration: InputDecoration(
                hintText: "Enter Second Number",
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.white
                  )
                )
              ),
            ),
            const SizedBox(height: 20,),
             Consumer<CalculatorProvider>(builder: (context, value, child) {
               return Text(value.sum.toString(),style: const TextStyle(fontSize: 28,color: Colors.white),);
             },),
            const SizedBox(height: 24,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Consumer<CalculatorProvider>(builder: (context, value, child) {
                return Row(

                  children: [
                    OutlinedButton(
                      onPressed: () {
                        value.add(
                          number1: double.tryParse(_number1TEController.text) ?? 0,
                          number2: double.tryParse(_number2TEController.text) ?? 0,
                        );
                      },
                      child: const Text("Add", style: TextStyle(color: Colors.white)),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        value.substract(
                          number1: double.tryParse(_number1TEController.text) ?? 0,
                          number2: double.tryParse(_number2TEController.text) ?? 0,
                        );
                      },
                      child: const Text("Minus", style: TextStyle(color: Colors.white)),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        value.multiple(
                          number1: double.tryParse(_number1TEController.text) ?? 0,
                          number2: double.tryParse(_number2TEController.text) ?? 0,
                        );
                      },
                      child: const Text("Multiply", style: TextStyle(color: Colors.white)),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        value.divide(
                          number1: double.tryParse(_number1TEController.text) ?? 0,
                          number2: double.tryParse(_number2TEController.text) ?? 0,
                        );
                      },
                      child: const Text("Divide", style: TextStyle(color: Colors.white)),
                    ),

                  ],
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
