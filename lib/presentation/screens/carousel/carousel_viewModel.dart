import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class CarouselViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int currentPage = 0;
  Timer? _timer;

  CarouselViewModel();

  void startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage < 4) {
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
    });
  }

    void stopAutoSlide() {
    _timer?.cancel();
  }

  void goToNextSlide() {
    if (currentPage < 4) {
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
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
