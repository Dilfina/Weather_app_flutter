// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app_flutter/configs/services/dio_module.dart' as _i7;
import 'package:weather_app_flutter/features/data/datasource/weather_datasource.dart'
    as _i4;
import 'package:weather_app_flutter/features/data/repository/weather_repository.dart'
    as _i5;
import 'package:weather_app_flutter/features/domain/weather_info/weather_info_bloc.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modules = _$Modules();
    gh.factory<String>(
      () => modules.baseUrl,
      instanceName: 'Base_url',
    );
    gh.lazySingleton<_i3.Dio>(
        () => modules.dio(gh<String>(instanceName: 'Base_url')));
    gh.factory<_i4.WeatherDatasource>(
        () => _i4.WeatherDatasource(gh<_i3.Dio>()));
    gh.factory<_i5.WeatherRepository>(
        () => _i5.WeatherRepository(gh<_i4.WeatherDatasource>()));
    gh.factory<_i6.WeatherInfoBloc>(
        () => _i6.WeatherInfoBloc(gh<_i5.WeatherRepository>()));
    return this;
  }
}

class _$Modules extends _i7.Modules {}
