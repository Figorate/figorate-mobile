import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottomNavViewModel(),
      builder: (context, viewModel, _) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            backgroundColor: AppColors.black,
            selectedItemColor: AppColors.green,
            unselectedItemColor: AppColors.black,
            selectedLabelStyle: TextStyle(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
            unselectedLabelStyle: TextStyle(
              color: AppColors.black,
              fontSize: 12.sp,
            ),
            onTap: (index) {
              pageController.jumpToPage(index);
              viewModel.onItemTapped(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(Assets.homeLogo, width: 24.w, height: 24.h),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.nutritionLogo, width: 24.w, height: 24.h),
                label: 'Nutrition',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.marketLogo, width: 24.w, height: 24.h),
                label: 'Market',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.communityLogo, width: 24.w, height: 24.h),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.profileLogo, width: 24.w, height: 24.h),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
