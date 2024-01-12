import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/getters.dart';

import '../../../core/app_theme.dart';

class WeatherTileWidget extends StatelessWidget {
  final String title;
  final String subTile;
  final double fontSize;

  const WeatherTileWidget({Key? key, required this.title, required this.subTile, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:TextStyle(fontSize: fontSize,fontWeight: FontWeight.w600, color:AppColors.ffFFFFFF )
        ),
        5.h,
        Text(
          subTile,
          style: AppTextStyles.s14w500.copyWith(color: Colors.grey[100]),
        ),
      ],
    );
  }
}
