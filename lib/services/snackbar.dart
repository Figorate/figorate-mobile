import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_done_icon.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class SnackbarService {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void error({
    required String message,
    int milliseconds = 5000,
  }) {
    showOverlayNotification(
      (context) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              elevation: 8,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  gradient: LinearGradient(
                    stops: const [0.02, 0.02],
                    colors: [AppColors.red, AppColors.white],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: AppColors.red,
                      size: 32.sp,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomText(
                        text: message,
                        fontSize: 12.sp,
                        color: AppColors.red
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: milliseconds),
    );
  }

  void success({
    required String message,
    int milliseconds = 5000,
  }) {
    showOverlayNotification(
      (context) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Material(
              elevation: 8,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  gradient: LinearGradient(
                    stops: const [0.02, 0.02],
                    colors: [AppColors.lightGreen, AppColors.white],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DoneIcon(
                      size: 36.sp,
                      color: AppColors.lightGreen,
                      iconColor: AppColors.white,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomText(
                        text: message,
                        fontSize: 12.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: milliseconds),
    );
  }
}