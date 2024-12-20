import 'package:figorate_mobile/core/constant/app_list.dart';
import 'package:figorate_mobile/core/constant/assets.dart';
import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:figorate_mobile/presentation/widgets/bottom_navigation.dart';
import 'package:figorate_mobile/presentation/widgets/custom_input_field.dart';
import 'package:figorate_mobile/presentation/widgets/custom_text.dart';
import 'package:figorate_mobile/presentation/widgets/custon_container.dart';
import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> blogItems = AppList.blogItems;
    final List<Map<String, String>> otherProgramsItem = AppList.otherProgramItem;
    final List<Map<String, String>> trendingProgram = AppList.trendingProgramsItem;
    ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: const AssetImage(Assets.profileLogo),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Welcome',
                              color: AppColors.white,
                              fontSize: 16.sp,
                            ),
                            CustomText(
                              text: "Ademola Lookman",
                              color: AppColors.white.withOpacity(0.7),
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            Assets.location,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            Assets.notification,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: CustomText(
                      text:
                          "'The only bad workout is the one that didn't happen, show up and crush it.'",
                      color: AppColors.white.withOpacity(0.7),
                      textAlign: TextAlign.left,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                CustomInputField(
                  borderColor: AppColors.white,
                  textColor: AppColors.white,
                  prefixIcon: Image.asset(
                    Assets.search,
                    height: 20.h,
                    width: 20.w,
                  ),
                  hintText: "Search Figorate",
                  borderRadius: 12.r,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CustomText(
                          text: "Recommendation",
                          fontSize: 18.sp,
                          isCenterAligned: false,
                          columnAlignment: CrossAxisAlignment.start,
                          color: AppColors.black,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            Assets.suyaSauce,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Customized Nutrition Plans",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              isCenterAligned: false,
                              columnAlignment: CrossAxisAlignment.start,
                            ),
                            CustomText(
                              text:
                                  "Well tailored nutrition plan that fits Your fitness level & health goals",
                              fontSize: 11.sp,
                              textAlign: TextAlign.left,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(text: "Blog & Article"),
                            CustomText(
                              text: "More",
                              fontSize: 11.sp,
                              color: AppColors.green,
                              onTap: () {
                                navigationService.pushNamed("routeName");
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20.h,
                            crossAxisSpacing: 10.w,
                          ),
                          itemCount: blogItems.length,
                          itemBuilder: (context, index) {
                            final blogItem = blogItems[index];
                            return Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    blogItem['image']!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(text: "Other Programs"),
                            CustomText(
                              text: "See All",
                              fontSize: 11.sp,
                              color: AppColors.green,
                              onTap: () {
                                navigationService.pushNamed("routeName");
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20.h,
                            crossAxisSpacing: 10.w,
                          ),
                          itemCount: otherProgramsItem.length,
                          itemBuilder: (context, index) {
                            final otherProgramsItems = otherProgramsItem[index];
                            return Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    otherProgramsItems['image']!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(text: "Trending Recipes"),
                            CustomText(
                              text: "See All",
                              fontSize: 11.sp,
                              color: AppColors.green,
                              onTap: () {
                                navigationService.pushNamed("routeName");
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: trendingProgram.length,
                            itemBuilder: (context, index) {
                              final trendingPrograms = trendingProgram[index];
                              return Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Container(
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    trendingPrograms['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, index, child) {
          return BottomNavigationBarWidget(
            currentIndex: index,
            onTap: (newIndex) {
              currentIndex.value = newIndex;
            },
          );
        },
      ),    
    );
  }
}