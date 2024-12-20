import 'package:figorate_mobile/presentation/screens/auth/pincode/pincode_viewmodel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_pincode.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class PincodeScreen extends StatelessWidget {
  const PincodeScreen({super.key});

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
                    CustomText(
                      text: 'A confirmation Email has been sent to Your email.',
                      color: AppColors.white,
                      textAlign: TextAlign.left,
                      fontSize: 26.sp,
                    ),
                    SizedBox(height: 30.h),
                    CustomPincode(
                      controller: viewModel.controller,
                      isPincodeValid: viewModel.isPincodeValid,
                      onPincodeChanged: viewModel.onPincodeChanged,
                      onConfirmPressed: () {
                        navigationService.pushNamed("/registeration");
                      },
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
