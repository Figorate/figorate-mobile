import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text_highlighter.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            CustomHighlightedText(
              text: "Get Started To Personalize Your Experience",
              highlightWords: "Personalize",
              highlightColor: AppColors.lightGreen,
              defaultColor: AppColors.white,
              textAlign: TextAlign.left,
              fontSize: 28.sp,
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.all(10.spMax),
              child: CustomText(
                text: 'To create a personalized nutrition and training plan for You, built by Our team of experts in medical and fitness',
                color: AppColors.white,
                fontSize: 16.sp,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 100.h),
            Center(
              child: CustomButton(
                onPressed: () {
                  navigationService.pushNamed("/gender");
                },
                text: 'Get Started',
                textColor: AppColors.green,
                fontWeight: FontWeight.w600,
                backgroundColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
