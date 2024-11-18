import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/auth/medical_condition/medical_condition_viewModel.dart';
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
        final List<String> conditions = [
          'Cardiovascular Disease',
          'Kidney Disease',
          'Hypertension',
          'Diabetes',
          'High Cholesterol',
          'None of the above',
        ];
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
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      children: List.generate(
                        conditions.length,
                        (index) => Column(
                          children: [
                            CustomGestureButton(
                              isSelected: viewModel.selectedMedicalConditions.contains(index),
                              buttonTitle: conditions[index],
                              onTap: () {
                                viewModel.toggleMedicalCondition(index);
                              },
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
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