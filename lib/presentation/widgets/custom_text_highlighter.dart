import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';

class CustomHighlightedText extends StatelessWidget {
  final String text;
  final String highlightWords;
  final Color? highlightColor;
  final Color? defaultColor;
  final TextAlign textAlign;
  final double fontSize;
  final bool isHighlightClickable;
  final Map<String, VoidCallback>? onHighlightTapMap;

  const CustomHighlightedText({
    super.key,
    required this.text,
    required this.highlightWords,
    this.highlightColor,
    this.defaultColor,
    this.textAlign = TextAlign.center,
    this.fontSize = 24,
    this.isHighlightClickable = false,
    this.onHighlightTapMap,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> highlightList = highlightWords.split(',').map((e) => e.trim()).toList();
    List<InlineSpan> createTextSpans(String fullText, List<String> highlightList) {
      List<InlineSpan> spans = [];
      int start = 0;
      for (final phrase in highlightList) {
        int matchIndex = fullText.indexOf(phrase, start);
        if (matchIndex == -1) continue;
        if (matchIndex > start) {
          spans.add(
            TextSpan(
              text: fullText.substring(start, matchIndex),
              style: GoogleFonts.poppins(
                fontSize: fontSize.sp,
                color: defaultColor ?? AppColors.black,
              ),
            ),
          );
        }
        spans.add(
          TextSpan(
            text: phrase,
            style: GoogleFonts.poppins(
              fontSize: fontSize.sp,
              color: highlightColor ?? AppColors.green,
            ),
            recognizer: isHighlightClickable &&
                    onHighlightTapMap != null &&
                    onHighlightTapMap!.containsKey(phrase)
                ? (TapGestureRecognizer()..onTap = onHighlightTapMap![phrase])
                : null,
          ),
        );
        start = matchIndex + phrase.length;
      }
      if (start < fullText.length) {
        spans.add(
          TextSpan(
            text: fullText.substring(start),
            style: GoogleFonts.poppins(
              fontSize: fontSize.sp,
              color: defaultColor ?? AppColors.black,
            ),
          ),
        );
      }
      return spans;
    }
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: createTextSpans(text, highlightList),
      ),
    );
  }
}
