import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class CarouselViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int currentPage = 0;

  CarouselViewModel();

  void goToNextSlide() {
    if (currentPage < 3) {
      currentPage++;
    } else {
      currentPage = 0;
    }
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
