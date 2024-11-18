import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final VoidCallback? onTap;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    this.textAlign = TextAlign.center,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: onTap != null ? AppColors.blue : color, 
      ),
      textAlign: textAlign,
    );
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: textWidget,
      );
    }

    return textWidget;
  }
}
