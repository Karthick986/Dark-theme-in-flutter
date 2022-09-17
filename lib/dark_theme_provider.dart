import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/my_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  MyPreferences myPreferences = MyPreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    myPreferences.setTheme(value);
    notifyListeners();
  }
}