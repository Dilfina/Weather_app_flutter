part of 'weather_info_bloc.dart';

@immutable
abstract class WeatherInfoState {}

class WeatherInfoInitial extends WeatherInfoState {}
class WeatherInfoLoading extends WeatherInfoState {}

class WeatherInfoSuccess extends WeatherInfoState {
  final List<WeatherModel> list;
  WeatherInfoSuccess(this.list);
}
class WeatherFailure extends WeatherInfoState {
  final String error;
  WeatherFailure(this.error);

}
