import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/core/theme/app_theme.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/age/age.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/gender/gender.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/health_goal/health_goal.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/medical_condition/medical_condition.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/nutrition_preference/nutrition_preference.dart';
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
                '/gender': (context) => const GenderScreen(),
                '/age': (context) => const AgeScreen(),
                "/medical-condition" : (context) => const MedicalConditionScreen(),
                "/health-goal" : (context) => const HealthGoalScreen(),
                "/nutrition-preference" : (context) => const NutritionPreferenceScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}