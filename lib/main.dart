import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Screen Entry Point
  runApp(
    ScreenUtilInit(
      designSize: const Size(
        360,
        773,
      ),
      builder: (context, child) => const MyApp(),
    ),
  );
}
