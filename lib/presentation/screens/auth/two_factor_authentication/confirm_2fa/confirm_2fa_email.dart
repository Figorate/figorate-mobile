import 'package:figorate_mobile/presentation/screens/auth/two_factor_authentication/confirm_2fa/confirm_2fa_email_viewmodel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_pincode.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class Confirm2FAEmailScreen extends StatelessWidget {
  const Confirm2FAEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => Confirm2faEmailViewmodel(),
      builder: (context, viewModel, child) {
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
                    Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text:'Enable 2FA',
                              fontSize: 26.sp,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        CustomText(
                          text: "A confirmation Email has been sent to Your email.",
                          fontSize: 15.sp,
                          textAlign: TextAlign.left,),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomPincode(
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.black,
                      pinFieldColor: AppColors.grey,
                      controller: viewModel.controller,
                      isPincodeValid: viewModel.isPincodeValid,
                      onPincodeChanged: viewModel.onPincodeChanged,
                      onConfirmPressed: viewModel.onConfirm,
                      buttonColor: AppColors.green,
                      buttonTextColor: AppColors.white,
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