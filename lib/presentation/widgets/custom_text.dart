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
  final String? title;
  final TextAlign? titleAlign;
  final CrossAxisAlignment columnAlignment;
  final bool isCenterAligned;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight,
    this.color = Colors.black,
    this.textAlign = TextAlign.center,
    this.onTap,
    this.title,
    this.titleAlign = TextAlign.left,
    this.columnAlignment = CrossAxisAlignment.start,
    this.isCenterAligned = true,
  });

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment effectiveAlignment =
        isCenterAligned ? CrossAxisAlignment.center : columnAlignment;

    final titleWidget = title != null
        ? Text(
            title!,
            style: GoogleFonts.poppins(
              fontSize: fontSize != null ? fontSize! + 2 : 18,
              color: color,
            ),
            textAlign: titleAlign,
          )
        : null;

    final textWidget = Align(
      alignment: isCenterAligned ? Alignment.center : Alignment.topLeft,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: onTap != null ? AppColors.blue : color,
        ),
        textAlign: textAlign,
      ),
    );

    final columnContent = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: effectiveAlignment,
      children: [
        if (titleWidget != null) titleWidget,
        textWidget,
      ],
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: columnContent,
      );
    }
    return columnContent;
  }
}
