import 'package:flutter/foundation.dart';

class MyModel extends ChangeNotifier {
  int secondCount = 0;
  int thirdCount = 0;
  int value = 0;
  String second = "";
  String third = "";

  void updateSecond() {
    this.second = (secondCount++).toString();
    notifyListeners();
  }

  void updateThird() {
    this.third = (thirdCount++).toString();
    notifyListeners();
  }

  void changeValue() {
    this.value += 1;
    notifyListeners();
  }
}