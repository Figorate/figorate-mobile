import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';

class CustomGestureButton extends StatelessWidget {
  final bool isSelected;
  final String buttonTitle;
  final VoidCallback onTap;

  const CustomGestureButton({
    super.key,
    required this.isSelected,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.grey, width: 1),
        ),
        child: Center(
          child: CustomText(
            text: buttonTitle,
            color: isSelected ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
