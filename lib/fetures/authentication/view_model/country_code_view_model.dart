import 'package:flutter/material.dart';
import 'package:marketfeed_clone/fetures/authentication/models/country_dropdown.dart';

class CountryCodeViewModel with ChangeNotifier {
  final Future<List<CountryModel>> allCountry = countryModelFromJson(getJson());
  Future<List<CountryModel>> result = countryModelFromJson(getJson());

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
                    );
          }).toList());
    }
    notifyListeners();
  }
}