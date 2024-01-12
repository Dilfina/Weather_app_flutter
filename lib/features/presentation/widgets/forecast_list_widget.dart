import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/app_theme.dart';
import 'package:weather_app_flutter/core/getters.dart';
import 'package:weather_app_flutter/features/data/model/weather/weather_model.dart';

import '../../../core/helper_methods.dart';

class ForeCastListWidget extends StatelessWidget {
  final WeatherModel? weatherModel;

  const ForeCastListWidget({Key? key, this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        10.h,
        Container(
          height: 1,
          color: Colors.grey,
        ),
        8.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.2,
                  child: Text(
                    "${HelperMethods().getWeekday(weatherModel?.dtTxt != null ? weatherModel!.dtTxt! : '')}",
                    style: AppTextStyles.s14w400
                        .copyWith(color: AppColors.ffFFFFFF),
                  )),
              10.w,
              CachedNetworkImage(
                  imageUrl:
                      'https://openweathermap.org/img/wn/${weatherModel!.weather!.first.icon}.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CircularProgressIndicator()),
              10.w,
              Text(
                "${HelperMethods().kelvinToCelsiusFormatted(weatherModel!.main!.tempMin!)}° to ${HelperMethods().kelvinToCelsiusFormatted(weatherModel!.main!.tempMax!)}° ",
                style:
                    AppTextStyles.s13w600.copyWith(color: AppColors.ffFFFFFF),
              )
            ],
          ),
        )
      ],
    );
  }
}
