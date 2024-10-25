import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/core/theme/app_theme.dart';
import 'package:figorate_mobile/presentation/screens/intro/get_started.dart';
import 'package:figorate_mobile/presentation/screens/splash/splash_screen.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      toastTheme: ToastThemeData(
        textColor: AppColors.black
      ),
      child: ScreenUtilInit(
        builder: (context, child) {
          return GestureDetector(
            child: MaterialApp(
              navigatorKey: navigationService.navigatorKey,
              title: 'Figorate',
              debugShowCheckedModeBanner: false,
              theme: getApplicationTheme(),
              home: const SplashScreen(),
              routes: {
                '/get-started': (context) => const GetStartedScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}