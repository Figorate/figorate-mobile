import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/health_goal/health_goal_viewModel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_carousel_indicator.dart';
import 'package:figorate_mobile/presentation/widgets/custom_gesture_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class HealthGoalScreen extends StatelessWidget {
  const HealthGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HealthGoalViewmodel(),
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
                      currentPage: 3,
                      totalPages: 5,
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        CustomText(
                          text: 'Health Goal',
                          fontSize: 28.sp,
                        ),
                        Image.asset(
                          Assets.healthGoalLogo,
                          width: 24.h,
                          height: 24.h,
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      children: [
                        CustomGestureButton(
                          isSelected: viewModel.selectedHealthGoal == 0,
                          buttonTitle: 'Weight Loss',
                          onTap: () {
                            viewModel.selectHealthGoal(0);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedHealthGoal == 1,
                          buttonTitle: 'Weight Gain',
                          onTap: () {
                            viewModel.selectHealthGoal(1);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedHealthGoal == 2,
                          buttonTitle: 'Improved Fitness',
                          onTap: () {
                            viewModel.selectHealthGoal(2);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedHealthGoal == 3,
                          buttonTitle: 'Improved Nutrition',
                          onTap: () {
                            viewModel.selectHealthGoal(3);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedHealthGoal == 4,
                          buttonTitle: 'Stress Management',
                          onTap: () {
                            viewModel.selectHealthGoal(4);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {
                        navigationService.pushNamed("/nutrition-preference");
                      },
                      text: 'Next',
                      textColor: AppColors.white,
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
