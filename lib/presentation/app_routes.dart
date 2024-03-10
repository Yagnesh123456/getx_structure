import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_structure/presentation/welcome/welcome_screen.dart';

import '../app/app_class.dart';
import 'login/binding/login_bindings.dart';
import 'login/login_screen.dart';
import 'splash/screen_splash.dart';
import 'welcome/binding/welcome_bindings.dart';

/// Used by [AppRoutes] of app
class AppRoutes {
  static const String routesSplash = '/';
  static const String routesWelcome = '/welcome';
  static const String routesLogin = '/login';
  static const String routesDashboard = '/dashboard';

  static final List<GetPage> pages = [
    //Splash Screen
    GetPage(
      name: AppRoutes.routesSplash,
      page: () => const SplashScreen(),
    ),

    //Welcome Screen
    GetPage(
        name: AppRoutes.routesWelcome,
        page: () => const WelcomeScreen(),
        binding: WelcomeBindings()),

    //Login Screen
    GetPage(
        name: AppRoutes.routesLogin,
        page: () => LoginScreen(),
        binding: LoginBindings()),

    //for dialog type screen
    // GetPage(
    //   name: AppRoutes.screenname,
    //   page: () => ScreenName(),
    //   binding: ScreenNameBinding(),
    //   maintainState: false,
    //   fullscreenDialog: true,
    //   //Transparent PageRoute in Flutter for displaying a (semi-) transparent page
    //   opaque: false,
    //   transition: Transition.cupertino,
    // ),
  ];
}
