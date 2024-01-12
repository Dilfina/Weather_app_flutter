import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/features/presentation/pages/city_list/city_list_screen.dart';

import '../../../../configs/auto_router/router.dart';
import 'navigation_bar/navigation_bar_item.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
         HomeRoute(),
        const CityListRoute(),
      ],
      lazyLoad: false,
      homeIndex: 0,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomNavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            changeIndex: (index) {
              setState(
                    () {
                  index != tabsRouter.activeIndex
                      ? tabsRouter.setActiveIndex(index)
                      : context.router.popTop();
                },
              );
            },
          ),
        );
      },
    );
  }
}
