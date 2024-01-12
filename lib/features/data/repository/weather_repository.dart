import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_flutter/features/data/model/weather/weather_model.dart';

import '../datasource/weather_datasource.dart';

@Injectable()
class WeatherRepository {
  final WeatherDatasource weatherDatasource;

  WeatherRepository(this.weatherDatasource);

  Future<List<WeatherModel>> getWeather(double latitude, double longitude) async {
    Response response = await weatherDatasource.getWeather(latitude, longitude);
    return (response.data['list'] as List)
        .map((e) => WeatherModel.fromJson(e))
        .toList();
  }
}
