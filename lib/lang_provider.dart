import 'package:flutter/cupertino.dart';

class LangProvider extends ChangeNotifier {

  void langChanged() {
    notifyListeners();
  }
}
