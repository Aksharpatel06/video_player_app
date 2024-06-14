import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier{
  int bottomIndex =0;

  void bottomChangeIndex(int index)
  {
    bottomIndex = index;
    notifyListeners();
  }
}