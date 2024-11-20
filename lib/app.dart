import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/core/theme/app_theme.dart';
import 'package:figorate_mobile/presentation/screens/auth/login/login.dart';
import 'package:figorate_mobile/presentation/screens/auth/pincode/pincode.dart';
import 'package:figorate_mobile/presentation/screens/auth/two_factor_authentication/confirm_2fa/confirm_2fa_email.dart';
import 'package:figorate_mobile/presentation/screens/auth/age/age.dart';
import 'package:figorate_mobile/presentation/screens/auth/gender/gender.dart';
import 'package:figorate_mobile/presentation/screens/auth/health_goal/health_goal.dart';
import 'package:figorate_mobile/presentation/screens/auth/medical_condition/medical_condition.dart';
import 'package:figorate_mobile/presentation/screens/auth/nutrition_preference/nutrition_preference.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/register.dart';
import 'package:figorate_mobile/presentation/screens/auth/reset_password/reset_password.dart';
import 'package:figorate_mobile/presentation/screens/auth/signup_manually/signup_manually.dart';
import 'package:figorate_mobile/presentation/screens/auth/two_factor_authentication/finger_print/enable_finger_print.dart';
import 'package:figorate_mobile/presentation/screens/auth/two_factor_authentication/two_factor_authentication.dart';
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
      toastTheme: ToastThemeData(textColor: AppColors.black),
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
                "/medical-condition": (context) =>
                    const MedicalConditionScreen(),
                "/health-goal": (context) => const HealthGoalScreen(),
                "/nutrition-preference": (context) =>
                    const NutritionPreferenceScreen(),
                "/log-in": (context) => const LoginScreen(),
                "/pincode": (context) => const PincodeScreen(),
                "/registeration": (context) => const RegisterationScreen(),
                "/sign-up-manually": (context) => const SignupManuallyScreen(),
                "/reset-password": (context) => const ResetPasswordScreen(),
                "/two-factor-authentication": (context) =>
                    const TwoFactorAuthenticationScreen(),
                "/confirm-2fa": (context) => const Confirm2FAEmailScreen(),
                "/enable-finger-print": (context) => const EnableFingerPrintScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}
