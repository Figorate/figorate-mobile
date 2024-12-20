import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/screens/homepage/homepage.dart';
import 'package:figorate_mobile/presentation/screens/nutrition/nutrition.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          onTap(index);
          switch (index) {
            case 0:
              navigationService.pushReplacement(const HomePageScreen());
              break;
            case 1:
              navigationService.pushReplacement(const NutritionScreen(),
              );
              break;
            default:
              break;
          }
        },
        backgroundColor: AppColors.grey,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? AppColors.green : AppColors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(Assets.homeLogo),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? AppColors.green : AppColors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(Assets.nutritionLogo),
            ),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? AppColors.green : AppColors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(Assets.communityLogo),
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? AppColors.green : AppColors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(Assets.marketLogo),
            ),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.profileLogo),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
