import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/app_colors.dart';

extension SystemChromeExtension on SystemChrome {
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.grey[100]!,
        statusBarColor: color,
        systemNavigationBarIconBrightness:
            AppColors.colorWhite == color ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            AppColors.colorWhite == color ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            AppColors.colorWhite == color ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
