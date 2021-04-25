import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  ThemeData theme = ThemeData.light();

  setDarkMode(ThemeData thm){
    theme = thm;
    notifyListeners();
  }
}