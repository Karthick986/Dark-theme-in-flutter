import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ThemeStyles {
  static ThemeData themeStatus(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: Theme.of(context).primaryColor,
      indicatorColor: isDarkTheme ? Colors.white70 : Colors.black54,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light
    );
  }
}