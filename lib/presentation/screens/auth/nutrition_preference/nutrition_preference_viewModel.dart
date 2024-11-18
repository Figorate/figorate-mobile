import 'package:stacked/stacked.dart';

class NutritionPreferenceViewmodel extends BaseViewModel {
  final List<int> _selectedNutritionPreference = [];
  List<int> get selectedHealthGoal => _selectedNutritionPreference;

  void toggleNutritionPreference(int index) {
    if (_selectedNutritionPreference.contains(index)) {
      _selectedNutritionPreference.remove(index);
      print("Removed Nutrition Preference Index: $index");
    } else {
      _selectedNutritionPreference.add(index);
      print("Added Nutrition Preference Index: $index");

    }
    notifyListeners();
  }
}
