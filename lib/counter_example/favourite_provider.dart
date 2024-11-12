import 'package:flutter/cupertino.dart';

class FavouriteProvider with ChangeNotifier{

  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItems(int value){
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItems(int value){
    _selectedItem.remove(value);
    notifyListeners();
  }



}