import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/screens/carousel/carousel_view_model.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/text_highlighter.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselScreen extends StatelessWidget {
  CarouselScreen({super.key});

  final List<String> _images = [
    Assets.firstPersonalizedIntro,
    Assets.secondPersonalizedIntro,
    Assets.thirdPersonalizedIntro,
    Assets.fourthPersonalizedIntro,
    Assets.fifthPersonalizedIntro,  
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CarouselViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.startAutoSlide();
      },
      builder: (context, viewModel, _) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 80.h,
                left: 0,
                right: 0,
                child: Image.asset(
                  _images[viewModel.currentPage],
                  height: 200.h,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                        CustomButton(
                          onPressed: () {
                            if (viewModel.currentPage == 4) {
                              navigationService.pushNamed("/get-started");
                            } else {
                              viewModel.goToNextSlide();
                            }
                          },
                          text: viewModel.currentPage == 4 ? 'Get started' : 'Next',
                          textColor: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _carouselItem(String title, String description, String highlightWord) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: HighlightedText(
              text: title,
              highlightWord: highlightWord,
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
