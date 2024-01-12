// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CityListEmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CityListEmptyScreen(),
      );
    },
    CityListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CityListScreen(),
      );
    },
    HomeEmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeEmptyScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(
          key: args.key,
          lon: args.lon,
          lat: args.lat,
          cityName: args.cityName,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
  };
}

/// generated route for
/// [CityListEmptyScreen]
class CityListEmptyRoute extends PageRouteInfo<void> {
  const CityListEmptyRoute({List<PageRouteInfo>? children})
      : super(
          CityListEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CityListEmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CityListScreen]
class CityListRoute extends PageRouteInfo<void> {
  const CityListRoute({List<PageRouteInfo>? children})
      : super(
          CityListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CityListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeEmptyScreen]
class HomeEmptyRoute extends PageRouteInfo<void> {
  const HomeEmptyRoute({List<PageRouteInfo>? children})
      : super(
          HomeEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeEmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    double? lon,
    double? lat,
    String? cityName,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            lon: lon,
            lat: lat,
            cityName: cityName,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.lon,
    this.lat,
    this.cityName,
  });

  final Key? key;

  final double? lon;

  final double? lat;

  final String? cityName;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, lon: $lon, lat: $lat, cityName: $cityName}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
