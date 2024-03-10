import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../utils/app_dimens.dart';
import '../../constant/assets_path.dart';
import '../../utils/extention.dart';
import '../app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Simulate splash screen delay
      navigateToHome(); // Navigate to home screen after splash
    });
  }

  @override
  Widget build(BuildContext context) {
    //Change Statusbar color
    SystemChromeExtension.setStatusBarColor(AppColors.colorSecondary);

    return Scaffold(
      backgroundColor: AppColors.colorSecondary,
      body: Center(
        child: SvgPicture.asset(
          AssetsPath.bird,
          width: Dimens.margin74,
          height: Dimens.margin74,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  void navigateToHome() {
    Get.offAllNamed(AppRoutes.routesWelcome);
  }
}
