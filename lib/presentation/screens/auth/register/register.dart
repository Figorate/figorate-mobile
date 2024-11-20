import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text_highlighter.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(arrowColor: AppColors.white),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomBottomDialog(
            height: 650.h,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: 'Sign Up \nCreate an account!',
                      fontSize: 26.sp,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  onPressed: () {},
                  text: 'Sign Up with Google',
                  textColor: AppColors.grey,
                  isEnabled: true,
                  borderColor: AppColors.grey,
                  backgroundColor: AppColors.white,
                  height: 45.h,
                  width: 500.w,
                  imagePath: Assets.googleLogo,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {},
                  text: 'Sign Up with Facebook',
                  textColor: AppColors.grey,
                  isEnabled: true,
                  borderColor: AppColors.grey,
                  backgroundColor: AppColors.white,
                  height: 45.h,
                  width: 500.w,
                  imagePath: Assets.facebookLogo,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {},
                  text: 'Sign Up with Apple',
                  textColor: AppColors.grey,
                  isEnabled: true,
                  backgroundColor: AppColors.white,
                  height: 45.h,
                  width: 500.w,
                  borderColor: AppColors.grey,
                  imagePath: Assets.appleLogo,
                ),
                SizedBox(height: 30.h),
                const Center(
                  child: CustomText(
                    text: "or",
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child:CustomHighlightedText(
                    text: "Sign up Manually",
                    highlightWords: "Manually",
                    fontSize: 16.sp,
                    highlightColor: AppColors.blue,
                    isHighlightClickable: true,
                    onHighlightTapMap: {
                      "Manually": () {
                        navigationService.pushNamed("/sign-up-manually");
                      },
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
