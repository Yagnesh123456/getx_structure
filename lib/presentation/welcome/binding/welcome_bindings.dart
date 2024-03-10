import 'package:get/get.dart';
import 'package:getx_structure/presentation/welcome/controller/welcome_controller.dart';


class WelcomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WelcomeController(),
    );
  }
}
