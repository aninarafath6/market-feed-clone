import 'package:flutter/material.dart';
import 'package:marketfeed_clone/fetures/authentication/models/country_dropdown.dart';

class CountryCodeViewModel with ChangeNotifier {
  final Future<List<CountryModel>> allCountry = countryModelFromJson(getJson());
  Future<List<CountryModel>> result = countryModelFromJson(getJson());
  bool _isDropDownOpen = false;
  CountryModel _selectedCountry = CountryModel(
    name: "India",
    dialCode: "+91",
    code: "IN",
  );

  CountryModel get selectedCountry => _selectedCountry;
  bool get isDropDownOpen => _isDropDownOpen;

  void updateDropDown(bool status) {
    _isDropDownOpen = status;
  }

  void filteredCountry(String keyword) {
    if (keyword.isEmpty) {
      result = allCountry;
    } else {
      result = allCountry.then((value) => value.where((country) {
            return country.name.toLowerCase().contains(
                      keyword.toLowerCase(),
                    ) ||
                country.dialCode.toLowerCase().contains(
                      keyword.toLowerCase(),
                    ) ||
                country.code.toLowerCase().contains(
                      keyword.toLowerCase(),
                    );
          }).toList());
    }
    notifyListeners();
  }

  void updateCountryCode(CountryModel country) {
    _selectedCountry = country;
    notifyListeners();
    result = allCountry;
  }
}
