import 'dart:math';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../data/local/storage_manager.dart';

import '../presentation/app_routes.dart';

import '../utils/ui_spaces.dart';
import 'assets_path.dart';


class CommonMethods {


  static apiFailureDialog({
    bool isServerDown = false,
    String errorLog = 'Error',
  }) {
    if (isServerDown) {
      print('Coffee Error $errorLog');
    }
    Get.closeAllSnackbars();
    if (!Get.isDialogOpen!) {
      Get.dialog(
        barrierDismissible: false,
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            title: Center(
              child: SizedBox(
                  height: 60,
                  width: 60,
                //  child:
                // Lottie.asset(
                //   isServerDown
                //       ? AppLottieAnimations.coffeeCookie
                //       : AppLottieAnimations.noInternet,
                //   fit: BoxFit.fitWidth,
                // ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isServerDown
                      ? 'Oops! Our server is taking a coffee break'
                      : 'Oops! Something Went Wrong!',
                  style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Color(
                      0xff052450,
                    ),),
                  textAlign: TextAlign.center,
                ),
                isServerDown ? Offstage() : sizedBoxH10,
                isServerDown
                    ? Offstage()
                    : Text(
                  'Check Your Internet Connection and Give it Another Shot!',
                  style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: EdgeInsets.all(
              10,
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  if (StorageManager.getString(StorageManager.prefIsLoggedIn) !=
                      '') {
                    Get.offAllNamed(
                      AppRoutes.routesDashboard,
                    );
                  } else {
                    Get.offAllNamed(
                      AppRoutes.routesSplash,
                    );
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      double.infinity,
                      38.h,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: Text(
                  'Refresh Now',
                ).paddingSymmetric(
                  horizontal: 12,
                ),
              )
            ],
          ),
        ),
      );
    }
  }


}
