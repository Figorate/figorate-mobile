import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String highlightWord;
  final Color? highlightColor;
  final Color? defaultColor;
  final TextAlign textAlign;
  final double fontSize;

  const HighlightedText({
    super.key,
    required this.text,
    required this.highlightWord,
    this.highlightColor,
    this.defaultColor,
    this.textAlign = TextAlign.center,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    List<String> words = text.split(' ');
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: words.map<InlineSpan>((word) {
          return TextSpan(
            text: ' $word',
            style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w600,
              color: word.contains(highlightWord) ? (highlightColor ?? AppColors.green) : (defaultColor ?? AppColors.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}
