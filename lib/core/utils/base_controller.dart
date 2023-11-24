import 'package:flutter/material.dart';

class BaseController with ChangeNotifier {
  void refreshView() => notifyListeners();
}
