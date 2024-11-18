import 'package:figorate_mobile/presentation/screens/auth/pincode/pincode_viewmodel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

class PincodeScreen extends StatelessWidget {
  const PincodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PincodeViewModel(),
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: CustomAppBar(arrowColor: AppColors.white),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomBottomDialog(
                height: 650.h,
                backgroundColor: AppColors.green,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:'A confirmation Email has been sent to Your email.',
                      color: AppColors.white,
                      textAlign: TextAlign.left,
                      fontSize: 26.sp,
                    ),
                    SizedBox(height: 30.h),
                    PinCodeTextField(
                      appContext: context,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: viewModel.controller,
                      length: 6,
                      cursorColor: AppColors.black,
                      backgroundColor: AppColors.green,
                      cursorHeight: 19.sp,
                      enableActiveFill: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 50.sp,
                        fieldWidth: 50.sp,
                        inactiveColor: AppColors.white,
                        selectedColor: AppColors.white,
                        activeColor: AppColors.white,
                        activeFillColor: AppColors.white,
                        selectedFillColor: AppColors.white,
                        borderWidth: 5.sp,
                        borderRadius: BorderRadius.circular(7)),
                      onChanged: ((value){
                        viewModel.onPincodeChanged(value);
                      }),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {
                        navigationService.pushNamed("/registeration");
                      },
                      text: 'Confirm',
                      textColor: AppColors.green,
                      isEnabled: viewModel.isPincodeValid,
                      height: 45.h,
                      backgroundColor: AppColors.white,
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