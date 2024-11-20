import 'package:figorate_mobile/presentation/screens/auth/reset_password/reset_password_viewmodel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_input_field.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ResetPasswordViewmodel(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'Reset Password',
                          fontSize: 28.sp,
                        )
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomInputField(
                      labelText: 'New Password',
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      errorText: viewModel.newPasswordError,
                      onChanged: viewModel.onPasswordChanged,
                    ),
                    SizedBox(height: 20.h),
                    CustomInputField(
                      labelText: 'Confirm Password',
                      obscureText: true,
                      errorText: viewModel.confirmPasswordError,
                      onChanged: viewModel.onConfirmPasswordChanged,
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      onPressed: () {
                        navigationService.pushNamed("/two-factor-authentication");
                      },
                      text: 'Reset Password',
                      textColor: AppColors.white,
                      isEnabled: viewModel.isFormValid,
                      height: 45.h,
                      width: 500.w,
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