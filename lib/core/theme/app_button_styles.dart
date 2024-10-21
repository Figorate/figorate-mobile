import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppButtonStyles {
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.green,
    foregroundColor: AppColors.green,
  );

  static ButtonStyle secondaryButton = TextButton.styleFrom(
    foregroundColor: AppColors.green,
  );
}
