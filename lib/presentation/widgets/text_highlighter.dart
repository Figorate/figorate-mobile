import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHighlightedText extends StatelessWidget {
  final String text;
  final String highlightWord;
  final Color? highlightColor;
  final Color? defaultColor;
  final TextAlign textAlign;
  final double fontSize;
  final bool isHighlightClickable;
  final VoidCallback? onHighlightTap;

  const CustomHighlightedText({
    super.key,
    required this.text,
    required this.highlightWord,
    this.highlightColor,
    this.defaultColor,
    this.textAlign = TextAlign.center,
    this.fontSize = 24,
    this.isHighlightClickable = false,
    this.onHighlightTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> words = text.split(' ');
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: words.map<InlineSpan>((word) {
          if (word.contains(highlightWord)) {
            return isHighlightClickable
                ? TextSpan(
                    text: ' $word',
                    style: GoogleFonts.poppins(
                      fontSize: fontSize.sp,
                      color: highlightColor ?? AppColors.green,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (onHighlightTap != null) {
                          onHighlightTap!();
                        }
                      },
                  )
                : TextSpan(
                    text: ' $word',
                    style: GoogleFonts.poppins(
                      fontSize: fontSize.sp,
                      color: highlightColor ?? AppColors.green,
                    ),
                  );
          } else {
            return TextSpan(
              text: ' $word',
              style: GoogleFonts.poppins(
                fontSize: fontSize.sp,
                color: defaultColor ?? AppColors.black,
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}
