import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../../features/presentation/pages/empty/empty_routers.dart';
import '../../features/presentation/pages/main/main_screen.dart';
import '../../features/presentation/pages/city_list/city_list_screen.dart';
import '../../features/presentation/pages/home/home_screen.dart';

part 'router.gr.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
// dart run build_runner build --delete-conflicting-outputs

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: '/', initial: true, children: [
          AutoRoute(page: HomeEmptyRoute.page, children: [
            AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
          ]),
          AutoRoute(page: CityListEmptyRoute.page, children: [
            AutoRoute(path: 'list', page: CityListRoute.page, initial: true),
          ]),
        ]),
      ];
}
