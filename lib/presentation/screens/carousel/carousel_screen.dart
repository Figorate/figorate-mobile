import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/screens/carousel/carousel_view_model.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CarouselViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.startAutoSlide();
      },
      builder: (context, viewModel, _) {
        return Container(
          height: 380.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView(
                    controller: viewModel.pageController,
                    onPageChanged: (int index) {
                      viewModel.currentPage = index;
                      viewModel.notifyListeners();
                    },
                    children: [
                      _carouselItem(
                          "Personalized Fitness\n Plans",
                          "Get tailor-made workouts for your goals, whether it's losing weight, gaining muscle, or getting fit.",
                          "Personalized"),
                      _carouselItem(
                          "Customized \nNutrition Programs",
                          "Enjoy meal plans and dietary advice personalized to your needs and \npreferences.",
                          "Nutrition"),
                      _carouselItem(
                          "Health Monitoring \nTools",
                          "Track your progress with heart rate, sleep, and activity monitoring for \noptimal results.",
                          "Monitoring"),
                      _carouselItem(
                          "Expert\n Consultations",
                          "Access certified trainers, dietitians, and healthcare pros for personalized \nguidance and support.",
                          "Expert"),
                      _carouselItem(
                          "Market \nPlace",
                          "Access certified trainers, dietitians, and healthcare pros for personalized \nguidance and support.",
                          "Market"),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: viewModel.currentPage == index ? 26.w : 26.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: viewModel.currentPage == index ? AppColors.green : AppColors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: viewModel.goToNextSlide,
                  child: CustomText(
                    text: 'Next',
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _carouselItem(String title, String description, String highlightWord) {
    List<String> words = title.split(' ');
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: words.map<InlineSpan>((word) {
                  return TextSpan(
                    text: '$word ',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: (word.contains(highlightWord))
                          ? AppColors.green
                          : Colors.black,
                    ),
                  );
                }).toList(),
              ),
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
