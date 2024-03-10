import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_structure/constant/app_colors.dart';

import '../../../../app/app_class.dart';
import '../../app_routes.dart';

class WelcomeController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onReady() {}

  void navigateToLogin() {
    Get.offAllNamed(
      AppRoutes.routesLogin,
    );
  }
}
