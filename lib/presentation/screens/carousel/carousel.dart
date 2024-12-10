import 'package:figorate_mobile/core/constant/app_list.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/screens/carousel/carousel_viewModel.dart';
import 'package:figorate_mobile/presentation/screens/intro/get_started.dart';
import 'package:figorate_mobile/presentation/widgets/carousel_item.dart';
import 'package:figorate_mobile/presentation/widgets/custom_dialog.dart';
import 'package:figorate_mobile/presentation/widgets/custom_button.dart';
import 'package:figorate_mobile/presentation/widgets/custom_carousel_indicator.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final List<String> carouselImage = AppList.carouselImages;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CarouselViewModel(),
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
                  carouselImage[viewModel.currentPage],
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
                        children: const [
                          CarouselItemScreen(
                              title: "Customized Nutrition Programs",
                              description: "Enjoy meal plans and dietary advice personalized to your needs and preferences.",
                              highlightWord: "Nutrition"),
                          CarouselItemScreen(
                              title: "Health Monitoring Tools",
                              description: "Track your progress with heart rate, sleep, and activity monitoring for optimal results.",
                              highlightWord: "Monitoring"),
                          CarouselItemScreen(
                              title: "Expert Consultations",
                              description: "Access certified trainers, dietitians, and healthcare pros for personalized guidance and support.",
                              highlightWord: "Expert"),
                          CarouselItemScreen(
                              title: "Market Place",
                              description: "Explore our curated marketplace for premium supplements, organic foods, and health tools designed to complement your journey.",
                              highlightWord: "Market"),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomCarouselIndicator(
                      currentPage: viewModel.currentPage,
                      totalPages: carouselImage.length,
                    ),
                    SizedBox(height: 30.h),
                  CustomButton(
                    onPressed: () {
                      if (viewModel.currentPage < 3) {
                        viewModel.goToNextSlide();
                      } else {
                        navigationService.pushAndRemoveUntil(
                          const GetStartedScreen(),
                        );
                      }
                    },
                    text: 'Next',
                    textColor: AppColors.white,
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
}