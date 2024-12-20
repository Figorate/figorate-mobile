import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/auth/pincode/pincode_viewmodel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class EnableFingerPrintScreen extends StatelessWidget {
  const EnableFingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PincodeViewModel>.reactive(
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
                    Column(
                      children: [
                        CustomText(
                          text: 'Enable 2FA',
                          color: AppColors.white,
                          textAlign: TextAlign.left,
                          isCenterAligned: false,
                          columnAlignment: CrossAxisAlignment.start,
                          fontSize: 26.sp,
                        ),
                        CustomText(
                          text: 'Enable Finger print login.',
                          color: AppColors.white,
                          textAlign: TextAlign.left,
                          fontSize: 26.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            Assets.backgroundForFingerPrint,
                            height: 200.h,
                            width: 200.w,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            Assets.fingerPrintImage,
                            height: 200.h,
                            width: 200.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {
                        navigationService.pushNamed("/homepage");
                      },
                      text: 'Confirm',
                      textColor: AppColors.green,
                      backgroundColor: AppColors.white,
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
