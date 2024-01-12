import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final int? dt;
  final MainModel? main;
  final List<WeatherInfoModel>? weather;
  final CloudsModel? clouds;
  final WindModel? wind;
  final int? visibility;
  final double? pop;
  final SysModel? sys;
  @JsonKey(name: 'dt_txt')
  final String? dtTxt;

  WeatherModel(this.dt, this.main, this.weather, this.clouds,
      this.wind, this.visibility, this.pop, this.sys, this.dtTxt);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@JsonSerializable()
class MainModel {
  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  @JsonKey(name: 'temp_min')
  final double? tempMin;
  @JsonKey(name: 'temp_max')
  final double? tempMax;
  final int? pressure;
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? groundLevel;
  final int? humidity;
  @JsonKey(name: 'temp_kf')
  final double? tempKf;

  MainModel(this.temp, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.seaLevel, this.groundLevel, this.humidity, this.tempKf);

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
}

@JsonSerializable()
class WeatherInfoModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherInfoModel(this.id, this.main, this.description, this.icon);

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoModelFromJson(json);
}

@JsonSerializable()
class CloudsModel {
  final int? all;

  CloudsModel(this.all);

  factory CloudsModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsModelFromJson(json);
}

@JsonSerializable()
class WindModel {
  final double? speed;
  final int? deg;
  final double? gust;
  WindModel(this.speed, this.deg, this.gust);

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
}

@JsonSerializable()
class SysModel {
  final String? pod;
  SysModel(this.pod);

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);
}


