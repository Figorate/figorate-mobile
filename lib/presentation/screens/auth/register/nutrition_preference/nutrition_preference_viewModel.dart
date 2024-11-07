import 'package:stacked/stacked.dart';

class NutritionPreferenceViewmodel extends BaseViewModel {
  int _selectedNutritionPreference = -1;
  int get selectedHealthGoal => _selectedNutritionPreference;

  void selectNutritionPreference(int index) {
    _selectedNutritionPreference = index;
    print("Selected Nutrition Preference Index: $_selectedNutritionPreference");
    notifyListeners();
  }
}
