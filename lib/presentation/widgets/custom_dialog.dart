import 'package:flutter/material.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomDialog extends StatelessWidget {
  final double height;
  final Widget content;
  final Color? backgroundColor;

  const CustomBottomDialog({
    super.key,
    required this.height,
    required this.content,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: content,
        ),
      ),
    );
  }
}
