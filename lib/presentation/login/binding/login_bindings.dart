import 'package:get/get.dart';
import 'package:getx_structure/presentation/welcome/controller/welcome_controller.dart';

import '../controller/login_controller.dart';


class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
    );
  }
}
