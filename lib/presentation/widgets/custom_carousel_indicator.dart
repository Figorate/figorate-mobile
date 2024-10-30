import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';

class CustomCarouselIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const CustomCarouselIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: 26.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.green : AppColors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
