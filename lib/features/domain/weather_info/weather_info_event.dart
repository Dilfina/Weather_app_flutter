part of 'weather_info_bloc.dart';

@immutable
abstract class WeatherInfoEvent {}

class GetWeatherInfo extends WeatherInfoEvent {
  final double latitude;
  final double longitude;

  GetWeatherInfo(this.latitude, this.longitude);
}
