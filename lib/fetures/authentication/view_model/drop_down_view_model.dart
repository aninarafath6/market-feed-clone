import 'package:flutter/material.dart';

class DropDownViewModel with ChangeNotifier {
  String _dropDownValue = '+91';

  get dropdownValue => _dropDownValue;

  void onChanged(String? value) {
    _dropDownValue = value!;
    notifyListeners();
  }
}
