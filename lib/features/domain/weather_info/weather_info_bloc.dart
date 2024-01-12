import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/weather/weather_model.dart';
import '../../data/repository/weather_repository.dart';

part 'weather_info_event.dart';
part 'weather_info_state.dart';


@injectable
class WeatherInfoBloc extends Bloc<WeatherInfoEvent, WeatherInfoState> {
  final WeatherRepository weatherRepository;
  WeatherInfoBloc(this.weatherRepository) : super(WeatherInfoInitial()) {
    on<GetWeatherInfo>((event, emit) async {
      emit(WeatherInfoLoading());
      try {
        List<WeatherModel> list = await weatherRepository.getWeather(event.latitude, event.longitude);
        emit(WeatherInfoSuccess(list));
      } catch (e) {
        emit(WeatherFailure(e.toString()));
        rethrow;
      }
    });
  }
}
