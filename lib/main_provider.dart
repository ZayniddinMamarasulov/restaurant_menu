import 'package:flutter/cupertino.dart';
import 'package:restaurant_menu/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  bool _isItemSelected = false;
  int _selectedItemIndex = 0;

  void setItemIndex(value) {
    _selectedItemIndex = value;
  }

  int getItemIndex() {
    return _selectedItemIndex;
  }

  bool getItemSelected() {
    return _isItemSelected;
  }

  void langChanged() {
    notifyListeners();
  }

  setFavourite(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(Constants.FAV_MEAL, index);
  }

  Future<int?> getFavourite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(Constants.FAV_MEAL)) {
      return prefs.getInt(Constants.FAV_MEAL);
    }
  }

  setFavList(List<int> indexes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      Constants.FAV_MEALS,
      indexes.map((e) => e.toString()).toList(),
    );
    notifyListeners();
  }

  Future<List<int>> getFavList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? res = prefs.getStringList(Constants.FAV_MEALS);
    if (res != null) {
      return res.map((e) => int.parse(e)).toList();
    }
    return List.empty();
  }
}
