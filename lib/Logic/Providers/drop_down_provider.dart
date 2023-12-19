import 'package:flutter/material.dart';

class DropdownButtonProvider with ChangeNotifier {
  List<String> gender = ['Male', 'Female', 'Others'];
  String? selectedGender;

  void changeLocation(String? location) {
    selectedGender = location;
    notifyListeners();
  }

  int? value;
  void changeValue(int val) {
    value = val;
    notifyListeners();
  }
}
