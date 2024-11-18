import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/auth/login/login_viewmodel.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewmodel(),
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
                          text: 'Welcome Back',
                          fontSize: 28.sp,
                        ),
                        Image.asset(
                          Assets.signInLogo,
                          width: 24.w,
                          height: 24.h,
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomInputField(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      errorText: viewModel.emailError,
                      onChanged: viewModel.onEmailChanged,
                    ),
                    SizedBox(height: 20.h),
                    CustomInputField(
                      labelText: 'Password',
                      obscureText: true,
                      errorText: viewModel.passwordError,
                      onChanged: viewModel.onPasswordChanged,
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: CustomText(
                          text: "Forget Password?",
                          fontWeight: FontWeight.w700,
                          onTap: () {
                            navigationService.pushNamed("");
                          }),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {
                        navigationService.pushNamed("");
                      },
                      text: 'Login',
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