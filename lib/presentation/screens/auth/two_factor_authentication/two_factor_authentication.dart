import 'package:figorate_mobile/presentation/screens/auth/two_factor_authentication/two_factor_authentication_viewmodel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';

class TwoFactorAuthenticationScreen extends StatelessWidget {
  const TwoFactorAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TwoFactorAuthenticationViewModel(),
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
                    Row(
                      children: [
                        CustomText(
                          text: 'Enable 2FA \nEnter Phone number',
                          fontSize: 26.sp,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        viewModel.onPhoneNumberChanged(number);
                      },
                      onInputValidated: (bool isValid) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      initialValue: viewModel.phoneNumber,
                      textFieldController: TextEditingController(),
                      formatInput: false,
                      keyboardType: TextInputType.phone,
                      inputDecoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                     SizedBox(height: 20.h),
                    CustomButton(
                      onPressed: () {
                        navigationService.pushNamed("/two-factor-authentication");
                      },
                      text: 'Enable',
                      textColor: AppColors.white,
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