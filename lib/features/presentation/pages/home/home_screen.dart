import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_route/annotations.dart';
import 'package:weather_app_flutter/core/app_theme.dart';
import 'package:weather_app_flutter/core/getters.dart';
import 'package:weather_app_flutter/core/helper_methods.dart';
import 'package:weather_app_flutter/features/domain/weather_info/weather_info_bloc.dart';

import '../../../../configs/injections/injections.dart';
import '../../../data/model/weather/weather_model.dart';
import '../../widgets/forcast_tile_widget.dart';
import '../../widgets/forecast_list_widget.dart';
import '../../widgets/info_widget.dart';
import '../../widgets/weather_tile_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  final String? cityName;
  final double? lat;
  final double? lon;
  const HomeScreen({Key? key, this.lon, this.lat, this.cityName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WeatherModel> hourlyForecasts = [];
  List<WeatherModel?> weeklyForecasts = [];

  final weatherBloc = getIt<WeatherInfoBloc>();
  @override
  void initState() {
    weatherBloc.add(GetWeatherInfo(widget.lat!=null?widget.lat!:43.2551, widget.lon!=null?widget.lat!:76.9126));
    super.initState();
  }
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    weatherBloc.add(GetWeatherInfo(widget.lat!=null?widget.lat!:43.2551, widget.lon!=null?widget.lat!:76.9126));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider.value(
        value: weatherBloc,
        child: BlocBuilder<WeatherInfoBloc, WeatherInfoState>(builder: (context, state) {
          if (state is WeatherInfoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherInfoSuccess) {
            hourlyForecasts = HelperMethods().getHourlyForecastsForDay(state.list, DateFormat('yyyy-MM-dd').format(DateTime.now()));
            weeklyForecasts = HelperMethods().getForecastsForNext7Days(state.list);
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        tileMode: TileMode.clamp,
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [AppColors.ff08203e, AppColors.ff557c93]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.1),
                      WeatherTileWidget(
                        title: widget.cityName!=null?widget.cityName!:"Almaty",
                        subTile: DateFormat('dd-MMM-yyyy').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                (state.list[0].dt ?? 0) * 1000)),
                        fontSize: 35,
                      ),
                      Center(
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://openweathermap.org/img/wn/${state.list[0].weather![0].icon}.png',
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const CircularProgressIndicator()),
                      ),
                      10.h,
                      WeatherTileWidget(
                        title:
                            "${HelperMethods().kelvinToCelsiusFormatted(state.list[0].main!.temp!)}°C",
                        subTile: "${state.list[0].weather![0].description}",
                        fontSize: 55,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.15, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InfoWidget(
                              icon: FontAwesomeIcons.wind,
                              text: "${state.list[0].wind!.speed}m/s",
                            ),
                            InfoWidget(
                              icon: FontAwesomeIcons.cloud,
                              text: "${state.list[0].clouds!.all}%",
                            ),
                            InfoWidget(
                              icon: FontAwesomeIcons.barsProgress,
                              text:
                                  "${HelperMethods().kelvinToCelsiusFormatted(state.list[0].main!.tempMin!)} to ${HelperMethods().kelvinToCelsiusFormatted(state.list[0].main!.tempMax!)} ",
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today",
                              style: AppTextStyles.s14w500
                                  .copyWith(color: AppColors.ffFFFFFF),
                            ),
                            Text("Forecasts",
                                style: AppTextStyles.s14w500
                                    .copyWith(color: AppColors.ffFFFFFF)),
                          ],
                        ),
                      ),
                      10.h,
                      Container(
                        height: 150,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ForeCastTileWidget(
                              temp:
                                  "${HelperMethods().kelvinToCelsiusFormatted(hourlyForecasts[index].main!.temp!)}",
                              time:
                                  "${DateFormat("HH:mm").format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(hourlyForecasts[index].dtTxt!))}",
                              iconUrl: hourlyForecasts[index].weather![0].icon,
                            );
                          },
                          itemCount: hourlyForecasts.length,
                        ),
                      ),
                      20.h,
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey, borderRadius: 20.r),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const FaIcon(
                                    Icons.calendar_month_outlined,
                                    color: AppColors.ffFFFFFF,
                                  ),
                                  10.w,
                                  Text(
                                    "Forecast for next days",
                                    style: AppTextStyles.s14w500
                                        .copyWith(color: AppColors.ffFFFFFF),
                                  )
                                ],
                              ),
                              10.h,
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: weeklyForecasts.length,
                                itemBuilder: (context, index) {
                                  return ForeCastListWidget(
                                    weatherModel: weeklyForecasts[index],
                                  );
                                },
                              )
                            ],
                          )),
                      20.h
                    ],
                  ),
                ),
              ),
            );
          }
          {
            return Text(state.toString());
          }
        }),
      ),
    );
  }
}
