import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_structure/constant/app_string.dart';

import '../../constant/app_colors.dart';
import '../../utils/extention.dart';
import '../../utils/ui_spaces.dart';
import '../common_view/common_button.dart';
import 'controller/welcome_controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChromeExtension.setStatusBarColor(AppColors.colorWhite);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sizedBoxH10,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  APPStrings.textWelcome,
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ],
            ),
            CommonButton(
              text: 'Press me',
              color: AppColors.colorSecondary,
              textColor: AppColors.colorWhite,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8.0),
              onPressed: () {
                controller.navigateToLogin();
                // Your button onPressed logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
