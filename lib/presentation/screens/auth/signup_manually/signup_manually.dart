import 'package:figorate_mobile/presentation/screens/auth/signup_manually/signup_manually_viewmodel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/custom_input_field.dart'; // Assuming this exists
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text_highlighter.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class SignupManuallyScreen extends StatelessWidget {
  const SignupManuallyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignupManuallyViewmodel(),
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: CustomAppBar(arrowColor: AppColors.white),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomBottomDialog(
                height: 650.h,
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'Sign up Manually',
                            fontSize: 26.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      CustomInputField(
                        labelText: 'First Name',
                        keyboardType: TextInputType.name,
                        errorText: viewModel.firstNameError,
                        onChanged: viewModel.onFirstNameChanged,
                      ),
                      SizedBox(height: 10.h),
                      CustomInputField(
                        labelText: 'Last Name',
                        keyboardType: TextInputType.name,
                        errorText: viewModel.lastNameError,
                        onChanged: viewModel.onLastNameChanged,
                      ),
                      CustomText(
                        text:
                            "Make sure it matches the name on your government ID.",
                        color: AppColors.grey,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.h),
                      CustomInputField(
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        errorText: viewModel.emailError,
                        onChanged: viewModel.onEmailChanged,
                      ),
                      CustomText(
                        text: "We will email you sign up confirmations.",
                        color: AppColors.grey,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10.h),
                      CustomInputField(
                        labelText: 'Password',
                        obscureText: true,
                        errorText: viewModel.passwordError,
                        onChanged: viewModel.onPasswordChanged,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                viewModel.isPasswordStrong
                                    ? Icons.check_circle
                                    : Icons.error,
                                color: viewModel.isPasswordStrong
                                    ? AppColors.green
                                    : AppColors.red,
                              ),
                              SizedBox(width: 8.w),
                              CustomText(
                                text: viewModel.passwordStrengthMessage,
                                color: viewModel.isPasswordStrong
                                      ? AppColors.green
                                      : AppColors.red,
                                  fontSize: 11.sp,
                                ),
                              
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 100.h),
                      CustomHighlightedText(
                        text:
                            "By selecting Agree and continue, I agree to Dynamic Layers Terms of Service, Payments Terms of Service and Notification Policy and acknowledge the Privacy Policy.",
                        highlightWords:
                            "Terms of Service, Payments Terms of Service, Notification Policy, Privacy Policy",
                        fontSize: 11.sp,
                        textAlign: TextAlign.left,
                        highlightColor: AppColors.blue,
                        isHighlightClickable: true,
                        onHighlightTapMap: {
                          "Terms of Service": () {
                            print("You have clicked me");
                            navigationService.pushNamed("/terms-of-service");
                          },
                          "Payments Terms of Service": () {
                            navigationService
                                .pushNamed("/payments-terms-of-service");
                          },
                          "Notification Policy": () {
                            navigationService.pushNamed("/notification-policy");
                          },
                          "Privacy Policy": () {
                            navigationService.pushNamed("/privacy-policy");
                          },
                        },
                      ),
                      SizedBox(height: 100.h),
                      CustomButton(
                        onPressed: viewModel.isFormValid
                            ? () {
                                navigationService.pushNamed("/reset-password");
                              }
                            : null,
                        text: 'Agree and Continue',
                        textColor: AppColors.white,
                        height: 45.h,
                        width: 500.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}