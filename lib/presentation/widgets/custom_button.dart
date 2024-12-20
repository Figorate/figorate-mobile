import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final bool isEnabled;
  final String? imagePath;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.isEnabled = true,
    this.imagePath,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250.w,
      height: height ?? 55.h,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? (backgroundColor ?? AppColors.green) : AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 7.r),
            side: BorderSide(
              color: borderColor ?? AppColors.transparent,
              width: 1.5.w,
            ),
          ),
        ),
        child: imagePath != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath!,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: text,
                    fontWeight: fontWeight,
                    color: isEnabled ? (textColor ?? AppColors.white) : AppColors.darkGrey,
                    fontSize: fontSize ?? 16.sp,
                  ),
                ],
              )
            : CustomText(
              text: text,
              textAlign: TextAlign.center,
              fontWeight: fontWeight,
              color: isEnabled ? (textColor ?? AppColors.white) : AppColors.darkGrey,
              fontSize: fontSize ?? 16.sp,
            ),
      ),
    );
  }
}
