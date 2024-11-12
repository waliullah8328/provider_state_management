import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier{

  int _count = 10;

  int get count => _count;

  void add(){
    _count++;
    notifyListeners();

  }




}

