import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/data/model/city/city_model.dart';
import '../features/data/model/weather/weather_model.dart';
import 'app_theme.dart';

class HelperMethods {
  String kelvinToCelsiusFormatted(double kelvin) {
    double celsius = kelvin - 273.15;
    return celsius.toStringAsFixed(1);
  }

  String getWeekday(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('EEEE').format(dateTime);
  }

  Future<void> saveCityToSharedPreferences(CityModel city) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cities = prefs.getStringList('cities') ?? [];

    // Check if the city is already in the list before adding it
    bool isDuplicate = cities.any((existingCityJson) {
      Map<String, dynamic> existingCityMap = jsonDecode(existingCityJson);
      CityModel existingCity = CityModel.fromMap(existingCityMap);
      return existingCity.city == city.city &&
          existingCity.latitude == city.latitude &&
          existingCity.longitude == city.longitude;
    });

    if (!isDuplicate) {
      cities.add(jsonEncode(city.toMap()));
      prefs.setStringList('cities', cities);
    }
  }


  Future<List<CityModel>> getCitiesFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cities = prefs.getStringList('cities') ?? [];
    return cities.map((cityJson) {
      Map<String, dynamic> cityMap = jsonDecode(cityJson);
      return CityModel.fromMap(cityMap);
    }).toList();
  }

  Future<CityModel?> openModalBottomSheet(
      BuildContext context,
      List<CityModel> cities,
      void Function(CityModel) onCitySelected,
      bool isDismissible) async {
    return await showModalBottomSheet<CityModel>(
      context: context,
      isDismissible: isDismissible,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: cities.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await saveCityToSharedPreferences(cities[index]);
                List<CityModel> selectedCities =
                    await HelperMethods().getCitiesFromSharedPreferences();
                print(
                    'Selected Cities from SharedPreferences: $selectedCities');

                Future.delayed(Duration.zero, () {
                  Navigator.pop(context, cities[index]);
                  onCitySelected(cities[index]);
                });
              },
              child: Text(
                cities[index].city,
                style: AppTextStyles.s19w500.copyWith(color: Colors.black),
              ),
            );
          },
          separatorBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                color: Colors.grey[400],
                height: 1,
              ),
            );
          },
        );
      },
    );
  }

  List<WeatherModel> getHourlyForecastsForDay(
      List<WeatherModel> weatherModels, String targetDay) {
    // Filter WeatherModel list for the specific day
    List<WeatherModel> forecastsForTargetDay = weatherModels
        .where((forecast) =>
            forecast.dtTxt != null && forecast.dtTxt!.contains(targetDay))
        .toList();
    return forecastsForTargetDay;
  }

  WeatherModel? getFirstForecastOfDay(
      List<WeatherModel> weatherModels, String targetDay) {
    for (WeatherModel forecast in weatherModels) {
      String day = forecast.dtTxt?.substring(0, 10) ?? '';
      if (day == targetDay) {
        return forecast;
      }
    }
    return null;
  }

  List<WeatherModel> getForecastsForNext7Days(
      List<WeatherModel> weatherModels) {
    List<WeatherModel> weeklyForecasts = [];

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Iterate for the next 7 days
    for (int i = 0; i < 7; i++) {
      // Calculate the target day
      DateTime targetDate = currentDate.add(Duration(days: i));
      String targetDay = DateFormat('yyyy-MM-dd').format(targetDate);

      // Get the first forecast for the target day
      WeatherModel? firstForecast =
          getFirstForecastOfDay(weatherModels, targetDay);

      // Add it to the list if not null
      if (firstForecast != null) {
        weeklyForecasts.add(firstForecast);
      }
    }
    return weeklyForecasts;
  }
}
