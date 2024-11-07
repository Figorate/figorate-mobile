import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/presentation/screens/carousel/carousel_viewModel.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_carousel_indicator.dart';
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
              CustomBottomDialog(
                height: 380.h,
                content: Column(
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
                    CustomCarouselIndicator(
                      currentPage: viewModel.currentPage,
                      totalPages: _images.length,
                    ),
                    SizedBox(height: 30.h),
                   CustomButton(
                      onPressed: () {
                        if (viewModel.currentPage < _images.length - 1) {
                          viewModel.pageController.animateToPage(
                            viewModel.currentPage + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                          viewModel.currentPage++;
                          viewModel.notifyListeners();
                        } else {
                          viewModel.stopAutoSlide();
                          navigationService.pushNamed("/get-started")?.then((_) {
                            viewModel.startAutoSlide();
                          });
                        }
                      },
                      text: 'Next',
                   )
                  ],
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
            child: CustomHighlightedText(
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
