import 'package:flutter/material.dart';

import '../../../core/helper_methods.dart';
import '../../data/model/city/city_model.dart';

class CitiesProvider extends ChangeNotifier {
  List<CityModel>? _cities;

  List<CityModel>? get cities => _cities;

  Future<void> updateCities() async {
    // Fetch cities from SharedPreferences and update the state
    _cities = await HelperMethods().getCitiesFromSharedPreferences();
    notifyListeners();
  }
}
