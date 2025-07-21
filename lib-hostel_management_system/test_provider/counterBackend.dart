import 'package:flutter/foundation.dart';

class CounterBackend extends ChangeNotifier {
  int _holdNumber = 0;

  int get holdNumber => _holdNumber;

  void incrementNumber() {
    if (_holdNumber >= 0) {
      _holdNumber++;
    }
    notifyListeners();
  }

  void decrementNumber() {
    if (_holdNumber >= 1) {
      _holdNumber--;
    }
    notifyListeners();
  }

  resetNumber() {
    _holdNumber = 0;
    notifyListeners();
  }
}
