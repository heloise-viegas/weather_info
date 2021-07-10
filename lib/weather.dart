import 'package:flutter/foundation.dart';

class Weather with ChangeNotifier {
  int _val = 25;
  String _type = 'celcius';
  int get tVal => _val;
  String get tType => _type;

  set tempVal(int v) {
    _val = v;
    notifyListeners();
  }

  set tempType(String s) {
    _type = s;
    notifyListeners();
  }
}
