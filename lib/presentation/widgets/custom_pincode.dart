import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';

class CustomPincode extends StatelessWidget {
  final TextEditingController controller;
  final bool isPincodeValid;
  final Function(String) onPincodeChanged;
  final VoidCallback? onConfirmPressed;
  final Color? backgroundColor;
  final Color? pinFieldColor;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? buttonTextColor;

  const CustomPincode({
    super.key,
    required this.controller,
    required this.isPincodeValid,
    required this.onPincodeChanged,
    this.onConfirmPressed,
    this.backgroundColor,
    this.pinFieldColor,
    this.borderColor,
    this.buttonColor,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    Color pinCodeBackgroundColor = backgroundColor ?? AppColors.green;
    Color fieldColor = pinFieldColor ?? AppColors.white;
    Color pinBorderColor = borderColor ?? AppColors.white;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PinCodeTextField(
          appContext: context,
          keyboardType: TextInputType.number,
          obscureText: true,
          obscuringCharacter: "*",
          controller: controller,
          length: 6,
          cursorColor: AppColors.black,
          backgroundColor: pinCodeBackgroundColor,
          cursorHeight: 19.sp,
          enableActiveFill: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldHeight: 60.sp,
            fieldWidth: 50.sp,
            inactiveColor: pinBorderColor,
            selectedColor: pinBorderColor,
            activeColor: pinBorderColor,
            inactiveFillColor: fieldColor,
            activeFillColor: fieldColor,
            selectedFillColor: fieldColor,
            borderWidth: 5.sp,
            borderRadius: BorderRadius.circular(7.r),
            fieldOuterPadding: EdgeInsets.symmetric(horizontal: 0.5.sp),
          ),
          onChanged: (value) {
            onPincodeChanged(value);
          },
        ),
        SizedBox(height: 30.h),
        CustomButton(
          onPressed: onConfirmPressed ?? () {},
          text: 'Confirm',
          textColor: buttonTextColor ?? AppColors.green,
          isEnabled: isPincodeValid,
          height: 45.h,
          backgroundColor: buttonColor ?? AppColors.white,
          width: 500.w,
        ),
      ],
    );
  }
}
