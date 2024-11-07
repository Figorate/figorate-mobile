import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/age/age_viewModel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_carousel_indicator.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AgeViewModel(),
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: CustomAppBar(arrowColor: AppColors.white),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomBottomDialog(
                height: 650.h,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomCarouselIndicator(
                      currentPage: 1,
                      totalPages: 6,
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        CustomText(
                          text: 'Age',
                          fontSize: 28.sp,
                        ),
                        Image.asset(
                          Assets.ageLogo,
                          width: 24.h,
                          height: 24.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: AppColors.deepYellow,
                        ),
                      ),
                      child: CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        onDateChanged: (selectedDate) {
                          viewModel.setDateOfBirth(selectedDate);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(
                            onPressed: () {
                              navigationService.pushNamed("/back");
                            },
                            width:80.w,
                            height: 30.h,
                            borderRadius: 9.r,
                            fontSize: 10.sp,
                            backgroundColor: AppColors.transparent,
                            text: 'Clear',
                            textColor: AppColors.deepWhite,
                          ),
                          SizedBox(width: 10.w),
                          CustomButton(
                            onPressed: () {
                              navigationService.pushNamed("");
                            },
                            width: 80.w,
                            height: 30.h,
                            borderRadius: 9.r,
                            fontSize: 10.sp,
                            text: 'Apply',
                            backgroundColor: AppColors.green,
                            textColor: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          navigationService.pushNamed("/medical-condition");
                        },
                        text: 'Next',
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}