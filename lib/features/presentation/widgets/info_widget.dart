import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_flutter/core/app_theme.dart';
import 'package:weather_app_flutter/core/getters.dart';

class InfoWidget extends StatefulWidget {
  final IconData? icon;
  final String? text;
  const InfoWidget({Key? key, this.icon, this.text}) : super(key: key);

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(widget.icon, color: AppColors.ffFFFFFF,),
        10.h,
        Text(widget.text!, style:AppTextStyles.s14w500.copyWith(color: AppColors.ffFFFFFF) ,)
      ],
    );
  }
}
