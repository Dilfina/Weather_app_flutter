// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      json['dt'] as int?,
      json['main'] == null
          ? null
          : MainModel.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['clouds'] == null
          ? null
          : CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      json['wind'] == null
          ? null
          : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      json['visibility'] as int?,
      (json['pop'] as num?)?.toDouble(),
      json['sys'] == null
          ? null
          : SysModel.fromJson(json['sys'] as Map<String, dynamic>),
      json['dt_txt'] as String?,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dt_txt': instance.dtTxt,
    };

MainModel _$MainModelFromJson(Map<String, dynamic> json) => MainModel(
      (json['temp'] as num?)?.toDouble(),
      (json['feels_like'] as num?)?.toDouble(),
      (json['temp_min'] as num?)?.toDouble(),
      (json['temp_max'] as num?)?.toDouble(),
      json['pressure'] as int?,
      json['sea_level'] as int?,
      json['grnd_level'] as int?,
      json['humidity'] as int?,
      (json['temp_kf'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.groundLevel,
      'humidity': instance.humidity,
      'temp_kf': instance.tempKf,
    };

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    WeatherInfoModel(
      json['id'] as int?,
      json['main'] as String?,
      json['description'] as String?,
      json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherInfoModelToJson(WeatherInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

CloudsModel _$CloudsModelFromJson(Map<String, dynamic> json) => CloudsModel(
      json['all'] as int?,
    );

Map<String, dynamic> _$CloudsModelToJson(CloudsModel instance) =>
    <String, dynamic>{
      'all': instance.all,
    };

WindModel _$WindModelFromJson(Map<String, dynamic> json) => WindModel(
      (json['speed'] as num?)?.toDouble(),
      json['deg'] as int?,
      (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

SysModel _$SysModelFromJson(Map<String, dynamic> json) => SysModel(
      json['pod'] as String?,
    );

Map<String, dynamic> _$SysModelToJson(SysModel instance) => <String, dynamic>{
      'pod': instance.pod,
    };
