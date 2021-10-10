import 'package:flutter/cupertino.dart';

class ColorProvider extends ChangeNotifier {
  var color = const Color(0xffff0000);

  void updateColor(Color c) {
    color = c;
    notifyListeners();
  }
}
