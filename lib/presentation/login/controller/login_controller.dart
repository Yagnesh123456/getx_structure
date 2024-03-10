import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_structure/constant/app_colors.dart';

import '../../../../app/app_class.dart';
import '../../../data/local/storage_manager.dart';
import '../../app_routes.dart';
import '../repo/login_repo.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final RxString username = ''.obs;
  final RxString password = ''.obs;
  final RxBool obscureText = true.obs;

  void setUsername(String value) => username.value = value;

  void setPassword(String value) => password.value = value;

  void toggleObscureText() => obscureText.value = !obscureText.value;

  void login() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      // Perform login logic here
      Get.snackbar('Success', 'Logged in as ${username.value}');
    }
  }

  ///[onLoginWithOTPV2]is use for login with email and pass api call
  Future<void> onLoginWithPasswordV2() async {
    Map<String, String> param = {
      'DeviceToken': StorageManager.getString(
        StorageManager.prefFCMToken,
      ),
      'Logintype': '',
      'Password': password.toString().trim(),
      'UserName': username.toString().trim(),
    };

    final result = await LoginRepo().loginUserV2(
      param: param,
    );

    result.fold((l) {
      Get.rawSnackbar(
        message: l.errorMessage,
      );
    }, (r) async {
      if (r.isNotEmpty) {
        // StorageManager.setString(
        //   StorageManager.prefLoginResponse,
        //   r.first.toJson(),
        // );

        navigateToDashboard();
      }
    });
  }

  void navigateToDashboard() {
    Get.offAllNamed(
      AppRoutes.routesDashboard,
    );
  }
}
