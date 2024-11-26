import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_input_field.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/custon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                height: 180.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20.r,
                              backgroundImage: const AssetImage(Assets.ageLogo),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Welcome',
                                  color: AppColors.white,
                                  fontSize: 16.sp,
                                ),
                                CustomText(
                                  text: "Ademola Lookman",
                                  color: AppColors.white.withOpacity(0.7),
                                  fontSize: 12.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                Assets.location,
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                Assets.notification,
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 50.w),
                        child: CustomText(
                          text: "'This is a quote'",
                          color: AppColors.white.withOpacity(0.7),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomInputField(
                      borderColor: AppColors.white,
                      height: 35.h,
                      textColor: AppColors.white,
                      prefixIcon: Image.asset(
                        Assets.seach,
                        height: 20.h,
                        width: 20.w,
                      ),
                      hintText: "Search Figorate",
                      borderRadius: 12.r,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
