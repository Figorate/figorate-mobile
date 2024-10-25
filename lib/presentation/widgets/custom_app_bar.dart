import 'package:flutter/material.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color arrowColor;

  const CustomAppBar({super.key, this.arrowColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.green,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: arrowColor),
        onPressed: () {
          navigationService.pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
