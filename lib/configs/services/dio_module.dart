import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


@module
abstract class Modules {
  @Named("Base_url")
  String get baseUrl => 'https://api.openweathermap.org/data/2.5/forecast';
      //'https://api.openweathermap.org/data/2.5/forecast?lat=51.169392&lon=71.449074&appid=a353c19935f49a87fc5681d08bad4111';

  @lazySingleton
  Dio dio(@Named('Base_url') String url) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }
}
