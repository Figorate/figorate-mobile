import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/text_highlighter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselItemScreen extends StatelessWidget {
  final String title;
  final String description;
  final String highlightWord;

  const CarouselItemScreen
({
    super.key,
    required this.title, 
    required this.description,
    required this.highlightWord,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomHighlightedText(
              text: title,
              highlightWords: highlightWord,
              highlightColor: AppColors.green,
            ),
          ),
          SizedBox(height: 25.h),
          CustomText(
            text: description,
            fontSize: 16.sp,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
