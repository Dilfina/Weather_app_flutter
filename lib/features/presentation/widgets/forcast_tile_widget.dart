import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/app_theme.dart';
import 'package:weather_app_flutter/core/getters.dart';

class ForeCastTileWidget extends StatelessWidget {
  final String? temp;
  final String? time;
  final String? iconUrl;
  const ForeCastTileWidget({Key? key, this.temp, this.time, this.iconUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: 20.r
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(temp?? '', style: AppTextStyles.s14w500.copyWith(color: Colors.white),),
            5.h,
            CachedNetworkImage(
                imageUrl: 'https://openweathermap.org/img/wn/${iconUrl}.png',
                height: 50,
                width: 50,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                const CircularProgressIndicator()),
            Text(time??'', style: AppTextStyles.s14w500.copyWith(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
