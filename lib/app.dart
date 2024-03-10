import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/app_class.dart';

import 'presentation/app_routes.dart';

import 'constant/app_colors.dart';
import 'constant/app_string.dart';
import 'utils/extention.dart';

/// Used by [MyApp] StatefulWidget for init of app
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

///[MyAppState] This class use to My App State
class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    addingMobileUiStyles(context);

    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      // initialBinding: AppStartbinding(),
      title: APPStrings.appName,
      theme: ThemeData(
        primarySwatch: AppColors.primaryPalette,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.colorWhite,
          centerTitle: true,
        ),
      ),
      builder: (context, widget) => getMainAppViewBuilder(context, widget),
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.routesSplash,
      onUnknownRoute: (settings) {
        print('unknown route called :${settings.name}');
        log('unknown route called :${settings.name}');
        return GetPageRoute(
            routeName: AppRoutes.routesSplash, page: () => Offstage());
      },
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en') // used in country code picker
      ],
    );
  }

  /// Used by [SystemChrome] of app
  void addingMobileUiStyles(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChromeExtension.setStatusBarColor(AppColors.colorWhite);
  }

  /// Create main app view builder
  Widget getMainAppViewBuilder(BuildContext context, Widget? widget) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Obx(() {
                return IgnorePointer(
                  ignoring: AppClass().isShowLoading.isTrue,
                  child: Stack(
                    children: [
                      widget ?? const Offstage(),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
