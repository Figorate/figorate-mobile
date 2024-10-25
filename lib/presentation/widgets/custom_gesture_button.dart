import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';

class CustomGestureButton extends StatelessWidget {
  final int selectedIndex;
  final List<String> buttonTitles;
  final ValueChanged<int> onSelect;

  const CustomGestureButton({
    super.key,
    required this.selectedIndex,
    required this.buttonTitles,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        children: List.generate(buttonTitles.length, (index) {
          return GestureDetector(
            onTap: () => onSelect(index), // Call onSelect with the index
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: selectedIndex == index ? AppColors.green : AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: CustomText(
                  text: buttonTitles[index], 
                  color: selectedIndex == index ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
