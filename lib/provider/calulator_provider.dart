import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier{

  double _sum = 0;

  double get sum => _sum;



  void add({var number1, var number2}){
    _sum = number1 + number2;
    notifyListeners();
  }

  void substract({var number1, var number2}){
    _sum = number1 - number2;
    notifyListeners();
  }

  void multiple({var number1, var number2}){
    _sum = number1 * number2;
    notifyListeners();
  }
  void divide({var number1, var number2}){
    _sum = number1 / number2;
    notifyListeners();
  }

}