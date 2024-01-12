import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_flutter/core/app_theme.dart';
import 'package:weather_app_flutter/core/consts.dart';
import 'package:weather_app_flutter/core/getters.dart';
import 'package:weather_app_flutter/features/presentation/widgets/wrapper_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter/configs/auto_router/router.dart';
import 'package:weather_app_flutter/core/helper_methods.dart';

import '../../../data/model/city/city_model.dart';

class CityListScreen extends StatefulWidget {
  const CityListScreen({Key? key}) : super(key: key);

  @override
  State<CityListScreen> createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  final ValueNotifier<List<CityModel>> citiesNotifier = ValueNotifier<List<CityModel>>([]);
  List<CityModel>? get cities => citiesNotifier.value;

  @override
  void initState() {
    super.initState();

    retrieveFromSharedPreferences();
  }

  Future<void> retrieveFromSharedPreferences() async {
    List<CityModel> retrievedCities = await HelperMethods().getCitiesFromSharedPreferences();
    // citiesNotifier.value = retrievedCities;
    setState(() {
      citiesNotifier.value = retrievedCities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<List<CityModel>>(
          valueListenable: citiesNotifier,
          builder: (context, updatedCities, _) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      tileMode: TileMode.clamp,
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [AppColors.ff08203e, AppColors.ff557c93]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Weather in your city",
                          style: AppTextStyles.s26w600
                              .copyWith(color: AppColors.ffFFFFFF),
                        ),
                        WrapperButton(
                          onPressed: () async {
                            await HelperMethods().openModalBottomSheet(
                                context,
                                kazakhstanCities,
                                    (selectedCity) {},
                                true);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                            ),
                            child: const FaIcon(
                              Icons.add,
                              size: 25,
                              color: AppColors.ffFFFFFF,
                            ),
                          ),
                        )
                      ],
                    ),
                    30.h,
                    updatedCities != null && updatedCities.isNotEmpty
                        ? ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return WrapperButton(
                          onPressed: () {
                            context.router.navigate(
                              HomeEmptyRoute(children: [
                                HomeRoute(
                                    lat: updatedCities[index].latitude,
                                    lon: updatedCities[index].longitude,
                                    cityName: updatedCities[index].city)
                              ]),
                            );
                          },
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: 20.r,
                              gradient: LinearGradient(
                                  tileMode: TileMode.clamp,
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blueGrey[300]!,
                                    AppColors.ff557c93
                                  ]),
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  updatedCities[index].city,
                                  style: AppTextStyles.s26w600.copyWith(
                                      color: AppColors.ffFFFFFF),
                                ),
                                5.h,
                                Text(
                                  "Touch to see",
                                  style: AppTextStyles.s12w400.copyWith(
                                      color: AppColors.ffFFFFFF),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return 15.h;
                      },
                      itemCount: updatedCities.length,
                    )
                        : const Center(
                      child: Text("No cities available"),
                    ),
                    20.h,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
