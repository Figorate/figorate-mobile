import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/text_highlighter.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            navigationService.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            HighlightedText(
              text: "Get Started To.\n Personalize \n Your Experience",
              highlightWord: "Personalize",
              highlightColor: AppColors.lightGreen,
              defaultColor: AppColors.white,
              textAlign: TextAlign.left,
              fontSize: 28.sp,
            ),
            SizedBox(height: 40.h),
            CustomText(
              text:
                  'To create a personalized nutritions and training plan for You, built by Our team \nof experts in medical and fitness',
              color: AppColors.white,
              fontSize: 16.sp,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 100.h),
            Center(
              child: CustomButton(
                onPressed: () {},
                text: 'Get Started',
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