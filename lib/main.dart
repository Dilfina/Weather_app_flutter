import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_flutter/core/consts.dart';
import 'package:weather_app_flutter/core/helper_methods.dart';
import 'package:weather_app_flutter/features/domain/weather_info/weather_info_bloc.dart';
import 'configs/auto_router/router.dart';
import 'configs/injections/injections.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // Check if it's the first launch
  bool isFirstLaunch = await checkFirstLaunch();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: MyApp(isFirstLaunch: isFirstLaunch),
      ),
    ),
  );
}

Future<bool> checkFirstLaunch() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

  // If it's the first launch, update the flag
  if (isFirstLaunch) {
    await prefs.setBool('firstLaunch', false);
  }
  return isFirstLaunch;
}

class MyApp extends StatefulWidget {
  final bool isFirstLaunch;

  const MyApp({super.key, required this.isFirstLaunch});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      if (mounted) {
        setState(() {
          versionCheck(context);
        });
      }
    });
    super.initState();
  }

  Future<void> versionCheck(BuildContext context) async {
    if (widget.isFirstLaunch) {
      await HelperMethods().openModalBottomSheet(context, kazakhstanCities,
          (selectedCity) {
        _appRouter.navigate(HomeEmptyRoute(
          children: [
            HomeRoute(
                lat: selectedCity.latitude,
                lon: selectedCity.longitude,
                cityName: selectedCity.city)
          ],
        ));
      }, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if it's not the first launch
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<WeatherInfoBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
