import 'package:figorate_mobile/core/constant/assets.dart';

class AppList {
  static final List<Map<String, String>> blogItems = [
    {
      'image': Assets.fakeFirstBlogImage,
      // 'title': 'Title 1',
      // 'description': 'Description for blog item 1',
    },
    {
      'image': Assets.secondBlogImage,
      // 'title': 'Title 2',
      // 'description': 'Description for blog item 2',
    },
    {
      'image': Assets.thirdBlogImage,
      // 'title': 'Title 3',
      // 'description': 'Description for blog item 3',
    },
    {
      'image': Assets.fourthBlogImage,
      // 'title': 'Title 4',
      // 'description': 'Description for blog item 4',
    },
  ];

  static final List<Map<String, String>> otherProgramItem = [
    {
      'image': Assets.firstOtherProgramImage,
      // 'title': 'Title 1',
      // 'description': 'Description for blog item 1',
    },
    {
      'image': Assets.secondOtherProgramImage,
      // 'title': 'Title 2',
      // 'description': 'Description for blog item 2',
    },
  ];

  static final List<Map<String, String>> trendingProgramsItem = [
    {
      'image': Assets.firstTrendingProgramImage,
      // 'title': 'Title 1',
      // 'description': 'Description for blog item 1',
    },
    {
      'image': Assets.firstTrendingProgramImage,
      // 'title': 'Title 2',
      // 'description': 'Description for blog item 2',
    },
  ];

  static final List<String> medicalConditions = [
    'Cardiovascular Disease',
    'Kidney Disease',
    'Hypertension',
    'Diabetes',
    'High Cholesterol',
    'None of the above',
  ];

  static final List<String> nutritionPreference = [
    'Vegan',
    'Vegeterian',
    'Gluten-Free',
    'Dairy Free',
    'Pescetarian',
    'None',
  ];

  static final List<String> healthGoal = [
    'Weight Loss',
    'Weight Gain',
    'Improved Fitness',
    'Improved Nutrition',
    'Stress Management',
  ];
}
