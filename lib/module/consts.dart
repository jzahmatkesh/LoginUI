import 'package:flutter/material.dart';

enum AppTheme{Light, Dark}

double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

final appThemeData = {
  AppTheme.Light :  ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    accentColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.grey[100]
  ),
  AppTheme.Dark :  ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    primaryColor: Color(0xFF294c60),
    accentColor: Colors.lightBlueAccent,
    scaffoldBackgroundColor: Colors.grey[800],
    bottomAppBarColor: Colors.grey[700]
  )
};

bool isDark(BuildContext context)=>Theme.of(context).brightness == Brightness.dark;
