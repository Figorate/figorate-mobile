import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/auth/register/medical_condition/medical_condition_viewModel.dart';
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

class MedicalConditionScreen extends StatelessWidget {
  const MedicalConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MedicalConditionViewmodel(),
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
                      currentPage: 2,
                      totalPages: 5,
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        CustomText(
                          text: 'Medical Condition',
                          fontSize: 28.sp,
                        ),
                        Image.asset(
                          Assets.medicalConditionLogo,
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
                          isSelected: viewModel.selectedMedicalCondition == 0,
                          buttonTitle: 'Cardiovascular Disease',
                          onTap: () {
                            viewModel.selectMedicalCondition(0);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedMedicalCondition == 1,
                          buttonTitle: 'Kidney Disease',
                          onTap: () {
                            viewModel.selectMedicalCondition(1);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedMedicalCondition == 2,
                          buttonTitle: 'Hypertension',
                          onTap: () {
                            viewModel.selectMedicalCondition(2);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedMedicalCondition == 3,
                          buttonTitle: 'Diabetes',
                          onTap: () {
                            viewModel.selectMedicalCondition(3);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedMedicalCondition == 4,
                          buttonTitle: 'High Cholesterol',
                          onTap: () {
                            viewModel.selectMedicalCondition(4);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          isSelected: viewModel.selectedMedicalCondition == 5,
                          buttonTitle: 'None of the above',
                          onTap: () {
                            viewModel.selectMedicalCondition(5);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {
                        navigationService.pushNamed("/health-goal");
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
