
import 'package:flutter/foundation.dart'; // for ChangeNotifier


class Counter with ChangeNotifier{
  int _count = 0;

  int getCount() => _count;

  void increament() {
    _count++;
    notifyListeners(); // it can be used when ChangeNotifier defined
  }
}