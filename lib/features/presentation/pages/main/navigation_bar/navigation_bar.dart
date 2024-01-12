import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBarItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final void Function(int index) changeIndex;
  final int index;

  const NavigationBarItem(
      {Key? key,
        required this.icon,
        this.isSelected = false,
        required this.changeIndex,
        required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      onPressed: () => changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: 30,
            height: 30,
            color: isSelected ? Colors.lightBlueAccent : Colors.white,
          ),
        ],
      ),
    );
  }
}
