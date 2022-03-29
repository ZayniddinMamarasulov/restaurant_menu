import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  bool _isItemSelected = false;
  int _selectedItemIndex = 0;

  void setItemIndex(value) {
    _selectedItemIndex = value;
  }

  int getItemIndex() {
    return _selectedItemIndex;
  }

  void isItemSelected(value) {
    _isItemSelected = value;
    notifyListeners();
  }

  bool getItemSelected() {
    return _isItemSelected;
  }

  void langChanged() {
    notifyListeners();
  }
}
