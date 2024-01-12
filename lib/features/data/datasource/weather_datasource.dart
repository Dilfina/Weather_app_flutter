import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class WeatherDatasource {
  final Dio dio;

  WeatherDatasource(this.dio);

  Future<Response> getWeather(double latitude, double longitude) async {
    final String apiKey = 'a353c19935f49a87fc5681d08bad4111';
    Response response = await dio.get('', queryParameters: {
      'lat': latitude,
      'lon': longitude,
      'appid': apiKey,
    });
    return response;
  }
}