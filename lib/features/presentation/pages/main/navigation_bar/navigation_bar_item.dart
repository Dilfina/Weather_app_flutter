import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/app_theme.dart';

import '../../../../../core/app_icons.dart';
import 'navigation_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) changeIndex;

  const CustomNavigationBar(
      {Key? key, required this.selectedIndex, required this.changeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> icons = [AppIcons.location, AppIcons.list];
    return Material(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                tileMode: TileMode.clamp,
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [AppColors.ff08203e, AppColors.ff557c93]),
        ),
        //height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
                (index) => Flexible(
              child: NavigationBarItem(
                index: index,
                isSelected: selectedIndex == index,
                icon: icons[index],
                changeIndex: changeIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
