import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_bottom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_carousel_indicator.dart';
import 'package:figorate_mobile/presentation/widgets/custom_gesture_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'gender_view_model.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GenderViewModel>.reactive(
      viewModelBuilder: () => GenderViewModel(),
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
                    CustomCarouselIndicator(
                      currentPage: viewModel.currentPage,
                      totalPages: 6,
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        CustomText(
                          text: 'Gender',
                          fontSize: 28.sp,
                        ),
                        Image.asset(
                          Assets.genderLogo, 
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
                          selectedIndex: viewModel.selectedGender, // Use the selected gender index
                          buttonTitles: const ['Male'], 
                          onSelect: (index) {
                            viewModel.selectGender(0); // Set to Male
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomGestureButton(
                          selectedIndex: viewModel.selectedGender, // Use the selected gender index
                          buttonTitles: const ['Female'],
                          onSelect: (index) {
                            viewModel.selectGender(1); // Set to Female
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {
                        viewModel.goToNext(); 
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
