import 'package:flutter/material.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';

class CustomBottomDialog extends StatelessWidget {
  final double height;
  final Widget content;

  const CustomBottomDialog({
    super.key,
    required this.height,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: content,
        ),
      ),
    );
  }
}
